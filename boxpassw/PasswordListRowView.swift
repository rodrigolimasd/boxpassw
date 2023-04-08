//
//  PasswordListRowView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import SwiftUI

struct PasswordListRowView: View {
    var title: String
    var subtitle: String
    var hided: String
    var showHided: Bool
    var isSelected: Bool
    var onSelect: (() -> Void)?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .foregroundColor(.primary)
                HStack {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(hided)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .opacity(showHided && isSelected ? 1 : 0)
                        
                }
            }
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
            }
        }.onTapGesture {
            onSelect?()
        }
    }
}

struct PasswordListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordListRowView(title:"title",subtitle: "subtitle", hided: "pass", showHided: true, isSelected: true) {
            
        }
    }
}


