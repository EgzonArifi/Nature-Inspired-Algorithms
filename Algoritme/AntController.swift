//
//  AntController.swift
//  Algoritme
//
//  Created by Egzon Arifi on 1/7/18.
//  Copyright © 2018 Overjump. All rights reserved.
//

import Cocoa

class AntController: NSViewController {
    
    @IBOutlet weak var AAntImageView: NSImageView!
    @IBOutlet weak var BAntImageView: NSImageView!
    @IBOutlet weak var CAntImageView: NSImageView!
    @IBOutlet weak var DAntImageView: NSImageView!
    
    @IBOutlet weak var ABPheromone: NSTextField!
    @IBOutlet weak var ACPheromone: NSTextField!
    @IBOutlet weak var CDPheromone: NSTextField!
    @IBOutlet weak var BDPheromone: NSTextField!
    @IBOutlet weak var ADPheromone: NSTextField!
    @IBOutlet weak var BCPheromone: NSTextField!
    
    @IBOutlet weak var ABDistance: NSTextField!
    @IBOutlet weak var ACDistance: NSTextField!
    @IBOutlet weak var CDDistance: NSTextField!
    @IBOutlet weak var BDDistance: NSTextField!
    @IBOutlet weak var ADDistance: NSTextField!
    @IBOutlet weak var BCDistance: NSTextField!
    
    @IBOutlet weak var beta: NSTextField!
    
    @IBOutlet weak var loger: NSTextField!
    
    @IBOutlet weak var betaLabel: NSTextField!
    
    var aco: ACO!
    var isInitialized = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aco = ACO.init(beta: Double(beta.stringValue)!)
        aco.setRandomRoute()
        isInitialized = true
        beta.stringValue = "\(aco.beta!)"
        setAntPostionInUI(position: nil)
        setPheromonesInUI()
        setDistnaceInUI()
    }
    
    @IBAction func moveAnt(_ sender: Any) {
        aco.beta = Double(beta.stringValue)!
        if aco.visitedRoutes.count == aco.totalCities {
            setAntPostionInUI(position: aco.visitedRoutes.first!)
        }
        if aco.moveToNextCity() == true {
            aco.setRandomRoute()
        }
        
        setAntPostionInUI(position: nil)
        setPheromonesInUI()
        setDistnaceInUI()
    }
    
    func setAntPostionInUI(position: Int!) {
        
        AAntImageView.isHidden = true
        BAntImageView.isHidden = true
        CAntImageView.isHidden = true
        DAntImageView.isHidden = true
        
        var cPosition = aco.currentPosition
        
        if let currentPosition = position {
            cPosition = currentPosition
        }
        
        switch cPosition {
        case 0: AAntImageView.isHidden = false
        case 1: BAntImageView.isHidden = false
        case 2: CAntImageView.isHidden = false
        case 3: DAntImageView.isHidden = false
        default: break
            
        }
    }
    
    func setPheromonesInUI() {
        ABPheromone.stringValue = "\(aco.routes[0][1].pheromone + aco.routes[1][0].pheromone)"
        ACPheromone.stringValue = "\(aco.routes[0][2].pheromone + aco.routes[2][0].pheromone)"
        CDPheromone.stringValue = "\(aco.routes[2][3].pheromone + aco.routes[3][2].pheromone)"
        BDPheromone.stringValue = "\(aco.routes[1][3].pheromone + aco.routes[3][1].pheromone)"
        ADPheromone.stringValue = "\(aco.routes[0][3].pheromone + aco.routes[3][0].pheromone)"
        BCPheromone.stringValue = "\(aco.routes[1][2].pheromone + aco.routes[2][1].pheromone)"
    }
    
    func setDistnaceInUI() {
        ABDistance.stringValue = "\(aco.routes[0][1].distance)"
        ACDistance.stringValue = "\(aco.routes[0][2].distance)"
        CDDistance.stringValue = "\(aco.routes[2][3].distance)"
        BDDistance.stringValue = "\(aco.routes[1][3].distance)"
        ADDistance.stringValue = "\(aco.routes[0][3].distance)"
        BCDistance.stringValue = "\(aco.routes[1][2].distance)"
    }
}
