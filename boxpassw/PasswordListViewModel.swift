//
//  PasswordListViewModel.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import Foundation
import SwiftUI
import CoreData

class PasswordListViewModel: ObservableObject {
    
   private var passwords = [Password]()
   private let viewContext = PersistenceController.shared.container.viewContext
       
   @Published var searchText = ""
   @Published var showAddPasswordView = false
   @Published var showEditPasswordView = false
   @Published var selectedPassword: Password?
    
    func fetchPasswords() {
        let request: NSFetchRequest<Password> = NSFetchRequest(entityName: "Password") as! NSFetchRequest<Password>
        
        do {
            passwords = try self.viewContext.fetch(request)
        } catch {
            print("Error fetching passwords: \(error.localizedDescription)")
        }
    }
    
    func filterPasswords(searchText: String = "") -> [Password] {
        if searchText.isEmpty {
            return passwords
        } else {
            return passwords.filter { password in
                password.name.lowercased().contains(searchText.lowercased()) ||
                password.username.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
}
