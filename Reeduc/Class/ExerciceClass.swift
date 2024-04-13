//
//  ExerciceClass.swift
//  Reeduc
//
//  Created by Maxime Pontille on 10/04/2024.
//

import Foundation

class Exercise: Identifiable, ObservableObject {
    let id = UUID()
    
    @Published var isChecked: Bool
    let name: String
    let rep: Int
    let ser: Int
    
    init(isChecked: Bool, name: String, rep: Int, ser: Int) {
        self.isChecked = isChecked
        self.name = name
        self.rep = rep
        self.ser = ser
    }
}

class ExerciseModel: Identifiable, ObservableObject {
    let id = UUID()
    
    @Published var exercices: [Exercise]
    
    init() {
        self.exercices = []
    }
    
    func toggleIsChecked(i: Int) {
        exercices[i].isChecked.toggle()
    }
    
    func addExercice(n: String, i: Int, x: Int) {
        if n.count > 44 {
            return
        }
        exercices.append(Exercise(isChecked: false, name: n, rep: i, ser: x))
    }
    
    func nCheck() -> Int {
        var n = 0
        for x in exercices {
            if x.isChecked == true {
                n += 1
            }
        }
        return n
    }
    
    func progression() -> Double {
        return Double(Double(nCheck()) / Double(exercices.count))
    }
    
}
