//
//  BookReviewApp.swift
//  BookReview
//
//  Created by A.f. Adib on 11/18/23.
//

import SwiftUI

@main
struct BookReviewApp: App {
   @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
