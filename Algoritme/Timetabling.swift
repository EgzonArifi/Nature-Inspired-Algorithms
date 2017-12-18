//
//  Timetabling.swift
//  Algoritme
//
//  Created by Egzon Arifi on 12/8/17.
//  Copyright © 2017 Overjump. All rights reserved.

//Exam with same students
// E1, E2
// E4, E5, E8
// E6, E4, E1

import Foundation

struct Exam {
    let exam: Int
    let position: Int
    let conflicts: [Int]
}

struct Tabling {
    let index: Int
    let exams: [Exam]
}

class Timetabling {
    
    public private(set) var exams: [Exam]!
    
    init() {
        exams = [
            Exam(exam: 1, position: 4,  conflicts: [2,4,6]),
            Exam(exam: 2, position: 5,  conflicts: [1]),
            Exam(exam: 3, position: 13, conflicts: []),
            Exam(exam: 4, position: 1,  conflicts: [5,8]),
            Exam(exam: 5, position: 1,  conflicts: [4,8]),
            Exam(exam: 6, position: 4,  conflicts: [1,4]),
            Exam(exam: 7, position: 13, conflicts: []),
            Exam(exam: 8, position: 2,  conflicts: [4,5])
        ]
    }
    
    init(exams: [Exam]) {
        self.exams = exams
    }
    
    func createTiemtabling() -> [Tabling] {
    
        var newTimetabling = [Tabling]()
        var tempExams = [Exam]()
        
        for item in exams {
            
            let positonForItem = getLegalPosition(exam: item)
            
            print(positonForItem)
            
            let newExam = Exam(exam: item.exam, position: positonForItem, conflicts: item.conflicts)
            tempExams.append(newExam)
            
            let result = newTimetabling.filter { $0.index == positonForItem-1 }
    
            if result.isEmpty {
                let timetbl = Tabling(index: positonForItem-1, exams: [newExam])
                newTimetabling.append(timetbl)
            } else {
                var tmpExamsIn = result.first?.exams
                tmpExamsIn?.append(newExam)
                let timetbl = Tabling(index: positonForItem-1, exams: tmpExamsIn!)
                newTimetabling.append(timetbl)
            }
            
        }
        
        var toReturnTimetabling = [Tabling]()
        for i in 0..<16 {
            let result = newTimetabling.filter { $0.index == i }
            if result.isEmpty {
                toReturnTimetabling.append(Tabling(index: -1, exams: []))
            } else {
                toReturnTimetabling.append(result.last!)
            }
        }
        
        return toReturnTimetabling
    }
    
    func getLegalPosition(exam: Exam) -> Int {
        
        var position = exam.position
        for i in 0..<exam.conflicts.count {
            
            if self.exams[exam.conflicts[i]-1].exam < exam.exam {
                
                if exam.position >= self.exams[exam.conflicts[i]-1].position {
                    position = position + 1
                }
            }
        }
        return position
    }

}
