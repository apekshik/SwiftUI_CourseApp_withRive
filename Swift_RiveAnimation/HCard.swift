//
//  HCard.swift
//  Swift_RiveAnimation
//
//  Created by Apekshik Panigrahi on 6/2/22.
//

import SwiftUI

struct HCard: View {
    var section: CourseSection
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: section.color.opacity(0.3), radius: 30, x: 0, y: 12)
        .shadow(color: section.color.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}

struct HCard_Previews: PreviewProvider {
    static var previews: some View {
        HCard(section: courseSections[1])
    }
}
