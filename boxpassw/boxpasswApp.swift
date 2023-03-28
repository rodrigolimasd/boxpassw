//
//  boxpasswApp.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 23/03/23.
//

import SwiftUI

@main
struct boxpasswApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoadingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
