//
//  BookReviewApp.swift
//  BookReview
//
//  Created by A.f. Adib on 11/18/23.
//

import SwiftUI

@main
struct BookReviewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
