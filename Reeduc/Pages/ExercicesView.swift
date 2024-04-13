//
//  ExercicesView.swift
//  Reeduc
//
//  Created by Maxime Pontille on 10/04/2024.
//

import SwiftUI

struct ExercicesView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var exerciceModel = ExerciseModel()
    @State private var textInput = ""
    @State private var nInput = ""
    @State private var xInput = ""
    @State private var showInputSizeAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(exerciceModel.exercices.indices, id:\.self) { i in
                VStack {
                    HStack {
                        Button(action: {
                            self.exerciceModel.toggleIsChecked(i: i)
                        }) {
                            Image(systemName: self.exerciceModel.exercices[i].isChecked ? "checkmark.circle.fill" : "circle")
                        }
                        Text(self.exerciceModel.exercices[i].name)
                        + Text(" - ")
                        + Text(String(self.exerciceModel.exercices[i].rep))
                        + Text("x")
                        + Text(String(self.exerciceModel.exercices[i].ser))
                    }
                    .padding()
                }
            }
        }
        HStack {
            TextField("Add exercise", text: $textInput)
                .textFieldStyle(.roundedBorder)
            
            TextField("Rep", text: $nInput)
                .textFieldStyle(.roundedBorder)
            
            TextField("Series", text: $xInput)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                if textInput.count > 44 || textInput.count < 1 || !nInput.isNumber || !xInput.isNumber {
                    showInputSizeAlert.toggle()
                }
                else {
                    exerciceModel.addExercice(n: textInput, i: Int(nInput) ?? 0, x: Int(xInput) ?? 0)
                }
            }) {
                Image(systemName: "plus")
            }
        }
        .padding()
        
        Spacer()
        
            .alert("EXERCISE INCORRECT", isPresented: $showInputSizeAlert) {
            } message: {
                Text("Name: 44 characters max. Rep: number only")
            }
            .navigationBarTitle("Exercises", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.red)
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
            )
    }
}

extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}

#Preview {
    ExercicesView()
}

#Preview {
    ExercicesView()
        .preferredColorScheme(.dark)
}
