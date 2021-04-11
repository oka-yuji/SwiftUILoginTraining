//
//  LoginView.swift
//  LoginTraining
//
//  Created by 岡優志 on 2021/04/10.
//

import SwiftUI

struct LoginView: View {
    @State var bottomState = CGSize.zero
    @State var showFull = false
    @ObservedObject var showModal = FlagViewModel()
    var body: some View {
        ZStack {
            ZStack{
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
                
                    Button(action: {}) {
                        ZStack{
                        CapsuleView()
                            .frame(width: 200, height: 60)
                        Text("Account creation")
                            .foregroundColor(Color("textColor"))
                        }
                    }
                Button(action: {self.showModal.showHalfModal.toggle()}) {
                    ZStack{
                    CapsuleView()
                        .frame(width: 200, height: 60)
                    Text("Login")
                        .foregroundColor(Color("textColor"))
                    }
                }
            }
            }
            
            .blur(radius: showModal.showHalfModal ? 5 : 0)
            .animation(.easeInOut)
            
            ZStack{
                HalfModalView()
                    .offset(y:showModal.showHalfModal ? 360 : 1000)
                    .offset(y: bottomState.height)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.6))

                    .gesture(
                        DragGesture().onChanged { value in
                            self.bottomState = value.translation
                            if self.showFull {
                                self.bottomState.height += -300
                            }
                            if self.bottomState.height < -300 {
                                self.bottomState.height = -300
                            }
                        }
                        .onEnded { value in
                            if self.bottomState.height > 50 {
                                self.showModal.showHalfModal = false
                               
                            }
                            if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                                self.bottomState.height = -300
                                self.showFull = true
                            } else {
                                self.bottomState = .zero
                                self.showFull = false

                            }
                        }
                    )
            } .frame(width: UIScreen.main.bounds.width)
            
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
