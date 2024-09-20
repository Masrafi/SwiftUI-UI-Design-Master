//
//  One.swift
//  UI Design
//
//  Created by Md Khorshed Alam on 18/9/24.
//

import SwiftUI

struct One: View {
    var body: some View {
        ZStack(alignment: .bottom) {
                Image(.bg4)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -60)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            // Gradient masking at bottom
                .mask{
                    Rectangle().fill(.linearGradient(
                        colors: [
                            .white,
                            .white,
                            .white,
                            .white,
                            .white.opacity(0.9),
                            .white.opacity(0.6),
                            .white.opacity(0.2),
                            .clear,
                            .clear
                        ], startPoint: .top, endPoint: .bottom
                    ))
                }.edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    One()
}
