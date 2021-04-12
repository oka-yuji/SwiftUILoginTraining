//
//  FlagViewModel.swift
//  LoginTraining
//
//  Created by 岡優志 on 2021/04/11.
//

import SwiftUI

class FlagViewModel: ObservableObject {
  @Published var showHalfModal = false
    @Published var showKeyboard = false
    @Published var isLoading = false
    @Published var showLoginSuccessView = false
    @Published var showLoginButton = true
    @Published var showSignUpButton = false
}
