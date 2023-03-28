//
//  LoadingView.swift
//  boxpassw
//
//  Created by Rodrigo Lima on 23/03/23.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            LottieView()
            Text("boxPass")
                .font(.title)
                .bold()
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isActive = true
            }
        }.fullScreenCover(isPresented: $isActive, content: {
            AuthenticationView()
        })
        .background(Color.cyan)
    }
}

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: "fingerprint")
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
