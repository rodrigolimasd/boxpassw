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
    
    @State private var name = ""
    @State private var username = ""
    @State private var password = ""
    @State private var active = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Password")) {
                    TextField("Name", text: $name)
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
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
                        let newPassword = Password
                            .create(name: name, username: username, _password: password, active: active)
                        
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
