//
//  SignInView.swift
//  Swift_RiveAnimation
//
//  Created by Apekshik Panigrahi on 5/31/22.
//

import SwiftUI


struct SignInView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .customFont(.headline)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField()
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField(Image("Icon Lock"))
            }
            
            Label("Sign In", systemImage: "arrow.forward")
                .customFont(.headline)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background((Color(hex: "F77D8E")))
                .foregroundColor(.white)
                .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                .cornerRadius(8 , corners: [.topLeft])
                .shadow(color: (Color(hex: "F77D8E")).opacity(0.6), radius: 20, x: 0, y: 10)
            HStack {
                Rectangle().frame(height: 1).opacity(0.2)
                Text("OR")
                    .customFont(.subheadline2)
                    .foregroundColor(.black.opacity(0.3))
                Rectangle().frame(height: 1).opacity(0.2)
            }
            Text("Sign up with Email, Apple, or Google")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.5), radius: 5, x: 0, y: 5)
        .shadow(color: Color("Shadow").opacity(0.5), radius: 50, x: 0, y: 30)
        .padding()

        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
