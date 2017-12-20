//
//  IETimetabling.swift
//  Algoritme
//
//  Created by Egzon Arifi on 12/8/17.
//  Copyright © 2017 Overjump. All rights reserved.
//

import Cocoa

class IETimetabling: NSViewController {
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    @IBOutlet weak var e1: NSTextField!
    @IBOutlet weak var e2: NSTextField!
    @IBOutlet weak var e3: NSTextField!
    @IBOutlet weak var e4: NSTextField!
    @IBOutlet weak var e5: NSTextField!
    @IBOutlet weak var e6: NSTextField!
    @IBOutlet weak var e7: NSTextField!
    @IBOutlet weak var e8: NSTextField!
    
    var exams = [Tabling]()
    var timetabling: Timetabling!
    var isMutate = false
    var tmpExams = [Tabling]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        createTimtabling()
    }
    
    func createTimtabling() {
        
        if let e1 = Int(e1.stringValue),let e2 = Int(e2.stringValue),
            let e3 = Int(e3.stringValue), let e4 = Int(e4.stringValue),
            let e5 = Int(e5.stringValue), let e6 = Int(e6.stringValue),
            let e7 = Int(e7.stringValue), let e8 = Int(e8.stringValue) {
            
            timetabling = Timetabling(exams: [
                Exam(exam: 1, position: e1,  conflicts: [2,4,6]),
                Exam(exam: 2, position: e2,  conflicts: [1]),
                Exam(exam: 3, position: e3, conflicts: []),
                Exam(exam: 4, position: e4,  conflicts: [5,8]),
                Exam(exam: 5, position: e5,  conflicts: [4,8]),
                Exam(exam: 6, position: e6,  conflicts: [1,4]),
                Exam(exam: 7, position: e7, conflicts: []),
                Exam(exam: 8, position: e8,  conflicts: [4,5])
                ])
            exams = timetabling.createTiemtabling()
            
        } else {
            timetabling = Timetabling()
            exams = timetabling.createTiemtabling()
        }
    }
    
    @IBAction func mutateSingleGene(_ sender: Any) {
        isMutate = true
        
        if let e1 = Int(e1.stringValue),let e2 = Int(e2.stringValue),
            let e3 = Int(e3.stringValue), let e4 = Int(e4.stringValue),
            let e5 = Int(e5.stringValue), let e6 = Int(e6.stringValue),
            let e7 = Int(e7.stringValue), let e8 = Int(e8.stringValue) {
            
            timetabling = Timetabling(exams: [
                Exam(exam: 1, position: e1,  conflicts: [2,4,6]),
                Exam(exam: 2, position: e2,  conflicts: [1]),
                Exam(exam: 3, position: e3, conflicts: []),
                Exam(exam: 4, position: e4,  conflicts: [5,8]),
                Exam(exam: 5, position: e5,  conflicts: [4,8]),
                Exam(exam: 6, position: e6,  conflicts: [1,4]),
                Exam(exam: 7, position: e7, conflicts: []),
                Exam(exam: 8, position: e8,  conflicts: [4,5])
                ])
            
            tmpExams = exams
            exams = []
            exams = timetabling.createTiemtabling()

        }
        
        collectionView.reloadData()
    }
}

extension IETimetabling : NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return exams.count
    }
    
    func collectionView(_ itemForRepresentedObjectAtcollectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "CollectionViewItem", for: indexPath)
        guard let collectionViewItem = item as? CollectionViewItem else {
            return item
        }
        
        if isMutate {
            collectionViewItem.changesLAbel.isHidden = false
            
            collectionViewItem.changesLAbel?.stringValue = ""
            
            for item in exams[indexPath.item].exams {
                if let text = collectionViewItem.changesLAbel?.stringValue {
                    collectionViewItem.changesLAbel?.stringValue = "\(text) E\(item.exam)"
                }
            }
            
            collectionViewItem.textField?.stringValue = ""
            
            for item in tmpExams[indexPath.item].exams {
                if let text = collectionViewItem.textField?.stringValue {
                    collectionViewItem.textField?.stringValue = "\(text) E\(item.exam)"
                }
            }
            
        } else {
            collectionViewItem.changesLAbel.isHidden = true
            
            collectionViewItem.textField?.stringValue = ""
            
            for item in exams[indexPath.item].exams {
                if let text = collectionViewItem.textField?.stringValue {
                    collectionViewItem.textField?.stringValue = "\(text) E\(item.exam)"
                }
            }
        }
        
        return item
    }
    
}

extension IETimetabling : NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: collectionView.bounds.size.width/4.5, height: collectionView.bounds.size.height/4.5)
    }
}

