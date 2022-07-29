//
//  SortView.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 27/07/22.
//

import SwiftUI

struct SortView: View {
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        ZStack {
            custom.customColor.color1.ignoresSafeArea()
            
            VStack(spacing: 25){
                ForEach(playViewModel.shuffleSentence, id: \.self) { index in
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
                .onMove {(source: IndexSet, destination: Int) -> Void in
                    self.playViewModel.shuffleSentence.move(fromOffsets: source, toOffset: destination)
                }
            }
        }.environmentObject(playViewModel)
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
