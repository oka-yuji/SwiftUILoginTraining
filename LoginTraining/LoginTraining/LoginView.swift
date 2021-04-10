//
//  LoginView.swift
//  LoginTraining
//
//  Created by 岡優志 on 2021/04/10.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            ZStack{
            Image("loginImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Rectangle()
                .foregroundColor(Color("opacityColor"))
                .opacity(0.4)
            }.edgesIgnoringSafeArea(.all)
            VStack {
                GeometryReader{ geometry in
                    Text("Login Training!!")
                        .font(.system(size: geometry.size.width/10, weight: .bold))
                        .foregroundColor(Color("textColor"))
                        .frame(maxWidth: .infinity)
                }
                .frame(width: UIScreen.main.bounds.width, height: 100)
                .offset(y: -100)
                
                ZStack {
                    CapsuleView()
                    Text("Account creation")
                }
                ZStack {
                    CapsuleView()
                    Text("Login")
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
