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
                
                Image(systemName: "lock.shield")
                    .font(.system(size: 100))
                    .padding(.bottom, 50)
                
                Button(action: authenticate, label: {
                    Text("Touch to Unlock")
                        .font(.title)
                })
            }
            .padding()
            
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
                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
