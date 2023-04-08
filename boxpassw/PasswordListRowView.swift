//
//  PasswordListRowView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 07/04/23.
//

import SwiftUI

struct PasswordListRowView: View {
    var password: PasswordData
    var isSelected: Bool
    var onSelect: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(password.domain!)
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
//        PasswordListRowView(password: getPasswordData(), isSelected: true)
//        {
//
//        }
//    }
//    private static func getPasswordData() -> PasswordData {
//        let pass = PasswordData()
//        pass.domain = "domain-test"
//        return pass
//    }
//}


