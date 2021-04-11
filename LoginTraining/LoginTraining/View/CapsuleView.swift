//
//  CapsuleView.swift
//  LoginTraining
//
//  Created by 岡優志 on 2021/04/10.
//

import SwiftUI

struct CapsuleView: View {
    var body: some View {
        ZStack{
            Capsule()
                .foregroundColor(Color("opacityColor").opacity(0.3))
                .shadow(color: Color("shadowColor"), radius: 5, x: 5, y: 5)
                .shadow(color: Color("shadowColor"), radius: 5, x: 5, y: 5)
                .shadow(color: Color("shadowColor"), radius: 5, x: 5, y: 5)
                .overlay(
                    Capsule()
                        .foregroundColor(Color("opacityColor").opacity(0.2))
                        .blur(radius: 10)
                        .blendMode(.colorBurn)
                )
        }
    }
}

struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView()
    }
}
