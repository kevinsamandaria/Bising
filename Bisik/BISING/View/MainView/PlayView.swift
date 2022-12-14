//
//  PlayView.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 24/07/22.
//

import SwiftUI
import AVFoundation

struct PlayView: View {
    @StateObject var playViewModel = PlayViewModel()
    @State var idx = 0
    @State var isPlaying = true
    @State var countDown = 60
    @State var timeRun = true
    @State var users = ["Paul", "Taylor", "Adele"]
    
    var tempArr:[String] = []
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            custom.customColor.color1.ignoresSafeArea()
            
            VStack{
                Text("Score: 0")
                    .font(.custom("Skia", size: 24))
                    .foregroundColor(custom.customColor.color4)
                    .padding(.leading, 230)
                
                VStack(alignment:.leading, spacing: 15){
                    ZStack{
                        Circle()
                            .fill(custom.customColor.color2)
                            .frame(width: 115, height: 115, alignment: .center)
                        Text("\(countDown)")
                            .onReceive(timer, perform: { _ in
                                if countDown > 0 && timeRun {
                                    countDown -= 1
                                } else {
                                    timeRun.toggle()
                                }
                            })
                            .font(.system(size: 48))
                    }
                    .padding(.bottom, 10)
                    
                    Text("Audio 1")
                        .foregroundColor(custom.customColor.color4)
                        .font(.custom("Skia", size: 28))
                    
                    HStack(alignment:.center, spacing:20){
                        Button {
                            isPlaying.toggle()
                            playViewModel.audioConfiguration(index: idx, isPlay: isPlaying)
                        } label: {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .resizable()
                                .foregroundColor(custom.customColor.color4)
                                .frame(width: 32, height: 32)
                        }
                        
                        Text("Audio")
                    }
                    .padding(.bottom, 50)
                }
                
                VStack(spacing: 25) {
//                    VStack(spacing: 25){
                    EditButton()
//                        List {
                    ForEach(users, id: \.self) { index in
                                Text("\(index)")
                                    .fontWeight(.bold)
                                    .padding(.leading, 20)
                                    .frame(width: 320, height: 60, alignment: .leading)
                                    .foregroundColor(.black)
                                    .moveDisabled(true)
                                    .font(.custom("Skia", size: 24))
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(custom.customColor.color4)
                                    )
                            }
                            .onMove(perform: move)
//                        }
//                    }
                }
            }
            .onAppear {
                playViewModel.audioConfiguration(index: idx, isPlay: isPlaying)
                playViewModel.sortWord(index: idx)
                playViewModel.shuffle(index: idx)
            }
            .padding(.bottom, 100)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
//            withAnimation {
//                isEditable = false
//            }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
