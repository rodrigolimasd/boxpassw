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
    
    var body: some View {
        NavigationView{
            VStack {
                SearchBarView(searchText: $searchText)
                
                List {
                    ForEach(passwords) { password in
                        PasswordListRowView(password: password, isSelected: self.selectedPasswords.contains(password))
                        {
                            if self.selectedPasswords.contains(password) {
                                selectedPasswords.remove(password)
                            } else {
                                self.selectedPasswords.insert(password)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        
                    }
                }
                
                
            }
            .navigationBarTitle("My Passwords")
            .navigationBarItems(
                 trailing:
                     Button(action: {
                         self.isShowAddPasswordView = true
                     }) {
                         Image(systemName: "plus")
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
