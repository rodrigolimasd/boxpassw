//
//  AuthenticationView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 23/03/23.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        ZStack {
            Color.cyan.edgesIgnoringSafeArea(.all)
            VStack {
                Text("boxPass")
                    .font(.system(size: 50))
                    .bold()
                    .padding()
                
                Button("Authenticate"){
                    authenticate()
                }
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                .background(Color.black)
                .font(.system(size: 23, weight: .bold))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }.fullScreenCover(isPresented: $isUnlocked, content: { UserPasswordListView() })
            
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is for security reasons") {
                success, authenticateError in
                
                if success {
                    self.isUnlocked = true
                }
            }
            
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
