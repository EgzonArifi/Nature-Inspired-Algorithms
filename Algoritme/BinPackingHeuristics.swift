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
    
    var bins = [BinPack]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hyperHeuristicsBinPacking()
    }
    
    @IBAction func mutateSingleGene(_ sender: Any) {
        hyperHeuristicsBinPacking()
    }
    
    func hyperHeuristicsBinPacking() {
        if let e1 = Float(e1.stringValue),let e2 = Float(e2.stringValue),
            let e3 = Float(e3.stringValue), let e4 = Float(e4.stringValue),
            let e5 = Float(e5.stringValue), let e6 = Float(e6.stringValue),
            let e7 = Float(e7.stringValue), let e8 = Float(e8.stringValue) {
            
            let binPack = BinPacking(weightsEncoding: [e1,e2,e3,e4,e5,e6,e7,e8],
                                     genotype: [3,2,1,2,3,1,2,1])
            bins = binPack.bins
            collectionView.reloadData()
        } else {
            print("Error")
        }
    }
    
}
extension BinPackingHeuristics : NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return bins.count
    }
    
    func collectionView(_ itemForRepresentedObjectAtcollectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "CollectionViewItem", for: indexPath)
        guard let collectionViewItem = item as? CollectionViewItem else {
            return item
        }
        
        collectionViewItem.textField?.stringValue = ""
        
        for item in bins[indexPath.item].weights {
            if let text = collectionViewItem.textField?.stringValue {
                collectionViewItem.textField?.stringValue = "\(text) \n W\(item)"
            }
        }
    
        return item
    }
    
}

extension BinPackingHeuristics : NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: collectionView.bounds.size.width/CGFloat(bins.count+1), height: collectionView.bounds.size.height)
    }
}
