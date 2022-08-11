//
//  SortView.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 27/07/22.
//

import SwiftUI

struct SortView: View {
//    @StateObject var playViewModel = PlayViewModel()
    @Binding var arr:[String]
    
    var body: some View {
            ZStack {
                custom.customColor.color1.ignoresSafeArea()
                VStack(spacing: 25){
    //                List {
                        ForEach(arr, id: \.self) { index in
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
                        .toolbar {
                            EditButton()
                        }
    //                }
                }
            }
        }
        //.environmentObject(playViewModel)
    
    func move(from source: IndexSet, to destination: Int) {
            arr.move(fromOffsets: source, toOffset: destination)
//            withAnimation {
//                isEditable = false
//            }
    }
}

//struct SortView_Previews: PreviewProvider {
//    static var previews: some View {
//        SortView(arr: PlayViewModel().shuffleSentence)
//    }
//}
