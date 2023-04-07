//
//  PasswordListRowView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import SwiftUI

struct PasswordListRowView: View {
    var password: Password
    var isSelected: Bool
    var onSelect: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(password.name)
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

//struct PasswordListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordListRowView()
//    }
//}
