//
//  SignInView.swift
//  Swift_RiveAnimation
//
//  Created by Apekshik Panigrahi on 5/31/22.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .customFont(.headline)
            
            VStack {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .padding(15)
                    .padding(.leading, 36)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke()
                        .fill(.black.opacity(0.1))
                    )
                    .overlay(Image("Icon Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    )
            
            }
            
            Divider()
            
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
