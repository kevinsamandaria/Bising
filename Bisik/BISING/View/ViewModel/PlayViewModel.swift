//
//  PlayViewModel.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 25/07/22.
//

import Foundation
import AVFoundation
import SwiftUI

struct List: Identifiable{
    var id: UUID
    var audio: String
}

class PlayViewModel: ObservableObject {
    var listSentences = DataController()
    let synthesizer = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance()
    
    @Published var audioData:[String] = []
    @Published var shuffleSentence:[String] = []
    @Published var sortedSentence:[String] = []
    @Published var score = 0
    
    func audioConfiguration(index:Int, isPlay:Bool){
        audioData = listSentences.savedEntity.map { entity in
            entity.value(forKey: "sentence") as! String
        }
        
        utterance = AVSpeechUtterance(string: audioData[index])
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        
        if isPlay{
            if(synthesizer.isPaused){
                synthesizer.continueSpeaking()
            } else {
                synthesizer.speak(utterance)
            }
        } else {
            synthesizer.pauseSpeaking(at: .immediate)
        }
    }
    
    func sortWord(index:Int) {
        var i = 0
        var idx = 0
        
        let split = audioData[index].split(separator:" ")
        var tempString:String = ""
        
        var roundInt:Double = Double(split.count)/Double(4)
        roundInt.round(.up)
        
        while i < split.count{
            if (i != 0 && i%Int(roundInt) == 0){
                idx += 1
                sortedSentence.append(tempString)
                tempString.removeAll()
            }
            
            tempString += String(split[i]) + " "
            
            if i == split.count-1{
                sortedSentence.append(tempString)
                break
            }
            
            i += 1
        }
    }
    
    func shuffle(index:Int) {
        var length = sortedSentence.count - 1
        var randIdx:Int
        
        while length >= 0 {
            randIdx = Int.random(in: 0..<sortedSentence.count)
            if !shuffleSentence.contains(sortedSentence[randIdx]){
                shuffleSentence.append(sortedSentence[randIdx])
                length -= 1
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
           shuffleSentence.move(fromOffsets: source, toOffset: destination)
    }
}
