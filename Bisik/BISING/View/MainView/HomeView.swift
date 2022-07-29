//
//  ContentView.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 21/07/22.
//

import SwiftUI

struct HomeView: View {
    @State var isPresent = false
//    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        NavigationView{
            ZStack {
                custom.customColor.color1.ignoresSafeArea()
                
                VStack(spacing: 45){
                    Text("Bising")
                        .font(.custom("Skia", size: 60))
                        .foregroundColor(custom.customColor.color4)
                        .padding(.bottom, 54)
                    
                    NavigationLink(destination: PlayView()
                                    .navigationBarBackButtonHidden(true)) {
                        Text("Play")
                            .fontWeight(.bold)
                            .frame(width: 320, height: 60, alignment: .center)
                            .foregroundColor(.black)
                            .font(.custom("Skia", size: 36))
                            .background(custom.customColor.color4)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black))
                    }
                    
                    Button {
                        isPresent.toggle()
                    } label: {
                        Text("How To Play")
                            .fontWeight(.bold)
                            .frame(width: 320, height: 60, alignment: .center)
                            .foregroundColor(.black)
                            .font(.custom("Skia", size: 36))
                            .background(custom.customColor.color4)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black))
                            .padding(.bottom, 150)
                    }.fullScreenCover(isPresented: $isPresent) {
                        HowToView()
                    }
                    
                }.frame(width: 3250, height: 305, alignment: .center)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
