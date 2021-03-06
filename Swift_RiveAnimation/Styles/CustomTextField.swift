//
//  CustomTextField.swift
//  Swift_RiveAnimation
//
//  Created by Apekshik Panigrahi on 5/31/22.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var image: Image
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke()
                .fill(.black.opacity(0.1))
            )
            .overlay(image.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            )
            .foregroundColor(Color("ConstantBlack"))
    }
}

extension View {
    func customTextField(_ image: Image = Image("Icon Email")) -> some View {
        modifier(CustomTextField(image: image))
    }
}
