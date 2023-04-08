//
//  PasswordListView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import SwiftUI

struct PasswordListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PasswordData.id, ascending: true)],
        animation: .default)
    private var passwords: FetchedResults<PasswordData>
    
    @State private var searchText = ""
    @State private var isShowAddPasswordView = false
    @State private var selectedPasswords = Set<PasswordData>()
    @State private var isShowPasswords = false
    
    func filterPasswords() -> [PasswordData] {
        return passwords.filter {
            ($0.domain?.lowercased().contains(searchText.lowercased()) == true ||
            $0.username?.lowercased().contains(searchText.lowercased()) == true) ||
            searchText.isEmpty
        }
    }
    
    private func deletePassword(at offsets: IndexSet) {
        for index in offsets {
            let pass = passwords[index]
            viewContext.delete(pass)
        }
        do {
                   try viewContext.save()
               } catch {
                   let nsError = error as NSError
                   fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
               }
    }
    
    var body: some View {
        NavigationView{
            VStack {
                SearchBarView(searchText: $searchText)
                
                List {
                    ForEach(filterPasswords()) { password in
                        PasswordListRowView(title: password.domain!, subtitle: password.username!, hided: password.password!, showHided: isShowPasswords, isSelected: self.selectedPasswords.contains(password))
                        {
                            if self.selectedPasswords.contains(password) {
                                selectedPasswords.remove(password)
                            } else {
                                self.selectedPasswords.insert(password)
                            }
                        }
                    }
                    .onDelete(perform: deletePassword)
                }
                
                
            }
            .navigationBarTitle("My Passwords")
            .navigationBarItems(
                 trailing:
                    HStack {
                        Button(action: {
                            self.isShowAddPasswordView = true
                        }) {
                            Image(systemName: "plus")
                        }
                        
                        Button(action: {
                            self.isShowPasswords = !self.isShowPasswords
                        }) {
                            Image(systemName: "eye")
                        }
                        .disabled(self.selectedPasswords.count == 0)
                    }
             )
             .sheet(isPresented: $isShowAddPasswordView) {
                 AddPasswordView()
             }
        }
        
    }
}

struct PasswordListView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
