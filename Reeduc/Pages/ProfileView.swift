//
//  ProfileView.swift
//  Reeduc
//
//  Created by Maxime Pontille on 10/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("NOM")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("PRENOM")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                }
                .padding()
                
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                
            }
            .padding()
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(lineWidth: 5)
                    .frame(height: 200)
                    .padding()
                
                VStack {
                    Text("Calendar")
                        .fontWeight(.bold)
                        .padding(.top, 25)
                    
                    Rectangle()
                        .fill(colorScheme == .light ? .black : .white)
                        .frame(height: 2)
                        .edgesIgnoringSafeArea(.horizontal)
                        .padding(.horizontal)
                }
            }
            .padding()
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(lineWidth: 5)
                    .frame(height: 200)
                    .padding()
                
                VStack {
                    Text("Achievements")
                        .fontWeight(.bold)
                        .padding(.top, 25)
                    
                    Rectangle()
                        .fill(colorScheme == .light ? .black : .white)
                        .frame(height: 2)
                        .edgesIgnoringSafeArea(.horizontal)
                        .padding(.horizontal)
                }
            }
            .padding()
            
            Spacer()
            
        }
        .navigationBarTitle("Profile", displayMode: .inline)
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

#Preview {
    ProfileView()
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}
