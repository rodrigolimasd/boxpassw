//
//  SearchBarView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onSeachButtonClicked: (() -> Void)?
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .padding(.horizontal, 10)
            
            Button(action: {
                onSeachButtonClicked?()
            }, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            })
            .padding(.trailing, 10)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), onSeachButtonClicked: nil)
            .previewLayout(.sizeThatFits)
    }
}
