//
//  HalfModalView.swift
//  LoginTraining
//
//  Created by 岡優志 on 2021/04/10.
//

import SwiftUI
import Firebase

struct HalfModalView: View {
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @EnvironmentObject var showModal: FlagViewModel
    @State var alertMessage = "メールアドレスもしくはパスワードが違います。"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.clear)
                .background(
                    Color("opacityColor").opacity(0.8)
                        .blur(radius: 10)
                )
                .cornerRadius(30)
                .shadow(radius: 10)
            VStack{
                VStack{
                    Rectangle()
                        .frame(width: 40, height: 5)
                        .cornerRadius(3)
                        .foregroundColor(Color.black.opacity(0.2))
                        .padding(.top, 8)
                }.padding(.bottom, 10)
                
                VStack {
                    Spacer(minLength: 1)
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundColor(Color.gray.opacity(0.8))
                            .font(.title2)
                            .padding(.leading)
                        TextField("Your Email", text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                            .frame(height: 40)
                    }
                    Spacer(minLength: 1)
                    
                    Divider()
                        .padding(.horizontal)
                    Spacer(minLength: 1)
                    
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(Color.gray.opacity(0.8))
                            .font(.title2)
                            .padding(.leading)
                        SecureField("  Pasword", text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
                            //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                            .frame(height: 40)
                    }
                    Spacer(minLength: 1)
                }
                .frame(width: UIScreen.main.bounds.width * 0.8,height: 130)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                
                HStack{
                    Spacer()
                    Button(action: {
                       login()
                    }) {
                        Text("Login")
                            .font(.title2).bold()
                    }
                    .padding(10)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color("textColor"))
                    .background(Color("opacityColor"))
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("エラー"),
                              message: Text(self.alertMessage),
                              dismissButton: .default(Text("OK")))
                    }
                }
                .padding(.trailing, 40)
                .padding(.top,30)
                
                Spacer()
            }
        }
    }
    
    func login() {
        self.hideKeyboard()
        self.showModal.isLoading = true
        self.showModal.showHalfModal = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.showModal.isLoading = false
            self.showAlert = true
        }
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

struct HalfModalView_Previews: PreviewProvider {
    static var previews: some View {
        HalfModalView()
            .environmentObject(FlagViewModel())
    }
}
