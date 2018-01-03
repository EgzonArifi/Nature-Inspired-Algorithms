//
//  BinPackingHeuristics.swift
//  Algoritme
//
//  Created by Egzon Arifi on 12/20/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class BinPackingHeuristics: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!
    
    @IBOutlet weak var e1: NSTextField!
    @IBOutlet weak var e2: NSTextField!
    @IBOutlet weak var e3: NSTextField!
    @IBOutlet weak var e4: NSTextField!
    @IBOutlet weak var e5: NSTextField!
    @IBOutlet weak var e6: NSTextField!
    @IBOutlet weak var e7: NSTextField!
    @IBOutlet weak var e8: NSTextField!
    
    @IBOutlet weak var g1: NSTextField!
    @IBOutlet weak var g2: NSTextField!
    @IBOutlet weak var g3: NSTextField!
    @IBOutlet weak var g4: NSTextField!
    @IBOutlet weak var g5: NSTextField!
    @IBOutlet weak var g6: NSTextField!
    @IBOutlet weak var g7: NSTextField!
    @IBOutlet weak var g8: NSTextField!
    
    var bins = [BinPack]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hyperHeuristicsBinPacking()
    }
    
    @IBAction func mutateSingleGene(_ sender: Any) {
        hyperHeuristicsBinPacking()
    }
    
    func hyperHeuristicsBinPacking() {
        if let e1 = Float(e1.stringValue), let e2 = Float(e2.stringValue),
            let e3 = Float(e3.stringValue), let e4 = Float(e4.stringValue),
            let e5 = Float(e5.stringValue), let e6 = Float(e6.stringValue),
            let e7 = Float(e7.stringValue), let e8 = Float(e8.stringValue),
            let g1 = Int(g1.stringValue), let g2 = Int(g2.stringValue),
            let g3 = Int(g3.stringValue), let g4 = Int(g4.stringValue),
            let g5 = Int(g5.stringValue), let g6 = Int(g6.stringValue),
            let g7 = Int(g7.stringValue), let g8 = Int(g8.stringValue) {
            
            let numberE1 = NSNumber(value: e1)
            let numberE2 = NSNumber(value: e2)
            let numberE3 = NSNumber(value: e3)
            let numberE4 = NSNumber(value: e4)
            let numberE5 = NSNumber(value: e5)
            let numberE6 = NSNumber(value: e6)
            let numberE7 = NSNumber(value: e7)
            let numberE8 = NSNumber(value: e8)
            
            let weights = [numberE1,numberE2,numberE3,numberE4,numberE5,numberE6,numberE7,numberE8]

            for item in weights {
                
                if item.floatValue > 5.000 {
                    errorDialog("Something went wrong!, One of items is beyond capacity")
                    return
                }
            }
            
            let binPack = BinPacking(weightsEncoding: weights as [Float],
                                     genotype: [g1,g2,g3,g4,g5,g6,g7,g8])
            bins = binPack.bins
            collectionView.reloadData()
        } else {
            errorDialog("Something went wrong!")
        }
    }
    
    func errorDialog(_ message: String) {
        let alert = NSAlert()
        alert.messageText = "Error"
        alert.informativeText = message
        alert.alertStyle = NSAlertStyle.warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    
}

extension BinPackingHeuristics : NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return bins.count
    }
    
    func collectionView(_ itemForRepresentedObjectAtcollectionView: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "CollectionViewItem", for: indexPath)
        guard let collectionViewItem = item as? CollectionViewItem else {
            return item
        }
        
        /*for item in bins[indexPath.item].weights {
            if let text = collectionViewItem.textField?.stringValue {
                collectionViewItem.textField?.stringValue = "\(text) \n \(item)"
            }
        }
        collectionViewItem.textField?.stringValue = ""*/
        collectionViewItem.configCell(binPack: bins[indexPath.item])
    
        return item
    }
}

extension BinPackingHeuristics : NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: collectionView.bounds.size.width/CGFloat(bins.count), height: collectionView.bounds.size.height)
    }
}
