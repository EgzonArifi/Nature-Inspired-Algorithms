//
//  ACO.swift
//  Algoritme
//
//  Created by Egzon Arifi on 1/11/18.
//  Copyright © 2018 Overjump. All rights reserved.
//

import Foundation
import Cocoa

class ACO {
    
    let totalCities = 4
    
    let AB = 10
    let AC = 10
    let AD = 5
    let BC = 40
    let CD = 20
    let BD = 40
    
    let ABpheromone = 2, ACpheromone = 1, ADpheromone = 2
    let BApheromone = 1, BCpheromone = 2, BDpheromone = 0
    let CApheromone = 1, CBpheromone = 2, CDpheromone = 2
    let DApheromone = 1, DBpheromone = 1, DCpheromone = 1
    
    public private(set) var routes = [[Route]]()
    public private(set) var currentPosition = 0
    public private(set) var visitedRoutes = [Int]()
    var beta: Double!
    var previousCity: Int!
    
    init(beta: Double) {
        
        self.beta = beta
        
        routes =
            [[Route(distance: 0, pheromone: 0),Route(distance: AB, pheromone: ABpheromone),Route(distance: AC, pheromone: ACpheromone),Route(distance: AD, pheromone: ADpheromone)],
             [Route(distance: AB, pheromone: BApheromone),Route(distance: 0, pheromone: 0),Route(distance: BC, pheromone: BCpheromone),Route(distance: BD, pheromone: BDpheromone)],
             [Route(distance: AC, pheromone: CApheromone),Route(distance: BC, pheromone: CBpheromone),Route(distance: 0, pheromone: 0),Route(distance: CD, pheromone: CDpheromone)],
             [Route(distance: AD, pheromone: DApheromone),Route(distance: BD, pheromone: DBpheromone),Route(distance: CD, pheromone: DCpheromone),Route(distance: 0, pheromone: 0)]]
        
    }
    
    func setRandomRoute() {
        currentPosition = getRandomRoute()
        previousCity = currentPosition
        visitedRoutes.append(currentPosition)
    }
    
    func finishDialog(_ message: String) {
        let alert = NSAlert()
        alert.messageText = "Traveling completed"
        alert.informativeText = message
        alert.alertStyle = NSAlertStyle.warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    func moveToNextCity() -> Bool {
        
        if visitedRoutes.count == totalCities {
            let oldRoute = routes[currentPosition][visitedRoutes.first!]
            let newRoute = Route(distance: oldRoute.distance, pheromone: oldRoute.pheromone + 1)
            routes[currentPosition][visitedRoutes.first!] = newRoute
            finishDialog("Done")
            visitedRoutes.removeAll()
            return true
        }
        
        var bestProbality = 0.0
        var nextPosition = currentPosition
        
        for (index,item) in routes[currentPosition].enumerated() {
            
            if item.distance != 0 && !visitedRoutes.contains(index) {
                
                var newProbabilty = 0.0
                let trs = item.pheromone + routes[index][currentPosition].pheromone
                let hrsBeta = Double(pow(Double(1.0/Double(item.distance)), beta))
                
                var sum = 0.0
                
                //Unvisited cities
                for (iInd, i) in routes[currentPosition].enumerated() {
                    print(i)
                    if i.distance != 0 && !visitedRoutes.contains(iInd) {
                        let Atrs = i.pheromone + routes[iInd][currentPosition].pheromone
                        let AhrsBeta = pow(Double(1.0/Double(i.distance)), beta)
                        sum = sum + (Double(Atrs) * AhrsBeta)
                    }
                }
                
                newProbabilty = (Double(trs) * hrsBeta) / Double(sum)
                
                //Logs
                print("Go to city: \(currentCity(index: index))")
                print("Pheromone = \(item.pheromone + routes[index][currentPosition].pheromone) --- Distance= \(item.distance)")
                print("Best probability = \(bestProbality)")
                print("New probability = \(newProbabilty)")
                print("New probability > Best probability ---- \(newProbabilty) > \(bestProbality)")
                print("------------------------------------------------")
                
                if newProbabilty > bestProbality {
                    bestProbality = newProbabilty
                    nextPosition = index
                }
            }
        }
        if bestProbality == 0.0 {
            let oldRoute = routes[currentPosition][nextPosition+1]
            let newRoute = Route(distance: oldRoute.distance, pheromone: oldRoute.pheromone + 1)
            routes[currentPosition][nextPosition+1] = newRoute
            currentPosition = nextPosition+1
            previousCity = currentPosition
            visitedRoutes.append(currentPosition)
        } else {
            
            let oldRoute = routes[currentPosition][nextPosition]
            let newRoute = Route(distance: oldRoute.distance, pheromone: oldRoute.pheromone + 1)
            routes[currentPosition][nextPosition] = newRoute
            currentPosition = nextPosition
            previousCity = currentPosition
            visitedRoutes.append(currentPosition)
        }
        
        return false
    }
    
    private func currentCity(index: Int) -> String {
        var city = ""
        switch index {
        case 0: city = "A"
        case 1: city = "B"
        case 2: city = "C"
        case 3: city = "D"
        default: break
        }
        return city
    }
    
    private func getRandomRoute() -> Int {
        
        let random = arc4random_uniform(4) + 0
        
        return Int(random)
    }
}

class Route {
    
    var distance: Int = 0
    var pheromone: Int = 0
    
    init(distance: Int, pheromone: Int) {
        
        self.pheromone = pheromone
        self.distance = distance
    }
}
