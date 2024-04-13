//
//  ContentView.swift
//  Reeduc
//
//  Created by Maxime Pontille on 09/04/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var exerciceModel = ExerciseModel()
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    ZStack {
                        CircularProgressionView(exerciceModel: exerciceModel)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.primary)
                            .padding()
                        VStack {
                            Text(String(exerciceModel.nCheck()))
                            Text("-")
                            Text(String(exerciceModel.exercices.count))
                        }
                        .font(.title)
                        .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                NavigationLink(destination: ProfileView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(colorScheme == .light ? .black : .white , lineWidth: 5)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.primary)
                            .padding()
                        Text("My Profile")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
                }
                .padding(.horizontal)

                NavigationLink(destination: ExercicesView(exerciceModel: exerciceModel)) {
                    ZStack {
                        Image(colorScheme == .light ? "ExercicesImageW" : "ExercicesImageD")
                            .resizable()
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(colorScheme == .light ? .black : .white , lineWidth: 5)
                            )
                            .padding()
                        Text("My Exercices")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
