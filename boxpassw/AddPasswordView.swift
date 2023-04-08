//
//  AddPasswordView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var domain = ""
    @State private var username = ""
    @State private var password = ""
    @State private var active = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Password")) {
                    TextField("Domain", text: $domain)
                    TextField("Username", text: $username)
                    TextField("Password", text: $password)
                }
                
                Section {
                    Toggle("Active", isOn: $active)
                }
            }
            .navigationTitle("Add Password")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
            trailing:
                    Button("Save") {
                        let newItem = PasswordData(context: viewContext)
                        newItem.id = UUID()
                        newItem.domain = self.domain
                        newItem.username = self.username
                        newItem.password = self.password
                        newItem.active = self.active
                        
                        do {
                            try viewContext.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    }
            )
        }
    }
}

struct AddPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordView()
    }
}
