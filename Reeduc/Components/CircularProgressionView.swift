//
//  CircularProgressionView.swift
//  Reeduc
//
//  Created by Maxime Pontille on 11/04/2024.
//

import SwiftUI

struct CircularProgressionView: View {

    @ObservedObject var exerciceModel = ExerciseModel()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.green.opacity(0.5),
                    lineWidth: 20
                )
            Circle()
                .trim(from: 0, to: exerciceModel.progression() > 0 ? exerciceModel.progression() : 0)
                .stroke(Color.green,
                        style: StrokeStyle(
                            lineWidth: 20,
                            lineCap: .round
                        )
                )
                .rotationEffect(.degrees(-90))
            
        }
    }
}

#Preview {
    CircularProgressionView()
}
