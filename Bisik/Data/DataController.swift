//
//  DataController.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 25/07/22.
//

import Foundation
import CoreData
import SwiftUI

class DataController: ObservableObject {
    @Published var savedEntity: [SentencesEntity] = []
    
    let container = NSPersistentContainer(name: "SentenceContainer")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Load Data \(error.localizedDescription)")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<SentencesEntity>(entityName: "SentencesEntity")
        
        do {
            savedEntity = try container.viewContext.fetch(request)
        } catch {
            print("Error Fetch \(error)")
        }
    }
    
    func addData() -> [SentencesEntity] {
        var arrSentences:[SentencesEntity] = []
//        var initial = UserDefaults.standard.bool(forKey: "Initial")
        
//        let addSentence = NSEntityDescription.insertNewObject(forEntityName: "SentencesEntity", into: container.viewContext) as! SentencesEntity
//        NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
        
        let listSentences = [
            "Sixty zippers were quickly picked by the hungry child.",
            "We went for a walk in the park and then got ice cream.",
            "I wake up to the sound of birds chirping outside my window."
        ]
        
        if UserDefaults.standard.bool(forKey: "Initial"){
            for (index, sentences) in listSentences.enumerated(){
                let addSentence = NSEntityDescription.insertNewObject(forEntityName: "SentencesEntity", into: container.viewContext) as! SentencesEntity
                
                addSentence.sentence = sentences
                addSentence.id = Double(index)
                arrSentences.append(addSentence)
            }
            print(UserDefaults.standard.bool(forKey: "Initial"))
            UserDefaults.standard.set(false, forKey: "Initial")
            print(UserDefaults.standard.bool(forKey: "Initial"))
        }
        
        do {
            try container.viewContext.save()
            fetchData()
        } catch {
            print("Error Add Data \(error)")
        }
        
        return arrSentences
    }
}
