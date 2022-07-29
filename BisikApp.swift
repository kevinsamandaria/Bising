//
//  BisikApp.swift
//  Bisik
//
//  Created by Kevin  Sam Andaria on 21/07/22.
//

import SwiftUI

@main
struct BisikApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            //            UserDefaults.standard.set(0, forKey: "initData")
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            //                tess()
            //                    .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
    
    init(){
        if UserDefaults.standard.object(forKey: "Initial") == nil{
            UserDefaults.standard.set(true, forKey: "Initial")
        }
    }
}
