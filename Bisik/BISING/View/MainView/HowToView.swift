//
//  HowToView.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 22/07/22.
//

import SwiftUI

struct HowToView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            custom.customColor.color1.ignoresSafeArea()
            VStack(alignment:.leading, spacing: 20){
                Text("How To Play")
                    .font(.custom("Skia", size: 40))
                    .fontWeight(.bold)
                    .frame(width: 238, height: 41, alignment: .leading)
                    .foregroundColor(custom.customColor.color4)
                    .padding(.bottom, 10)
                
                Text("1. You will hear audio of each question")
                    .font(.custom("Skia", size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(custom.customColor.color4)
                    .frame(minWidth: 299, idealWidth: 299, maxWidth: 338, idealHeight: 44, alignment: .leading)
                
                Text("2. There are words that you will arrange to make sentences that match the audio")
                    .font(.custom("Skia", size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(custom.customColor.color4)
                    .frame(minWidth: 299, idealWidth: 299, maxWidth: 338, idealHeight: 44, alignment: .leading)
                
                Text("3. Each correct sentence will get a score")
                    .font(.custom("Skia", size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(custom.customColor.color4)
                    .frame(minWidth: 299, idealWidth: 299, maxWidth: 338, idealHeight: 44, alignment: .leading)
                
                Text("4. You must complete as many questions as possible in 60 seconds ")
                    .font(.custom("Skia", size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(custom.customColor.color4)
                    .frame(minWidth: 299, idealWidth: 299, maxWidth: 338, idealHeight: 44, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Main Menu")
                        .fontWeight(.bold)
                        
                        .frame(width: 160, height: 50, alignment: .center)
                        .foregroundColor(.black)
                        .font(.custom("Skia", size: 17))
                        .background(custom.customColor.color4)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black))
                }).padding(.horizontal, 90)
            }
            .frame(width: 338, height: 493)
        }
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
