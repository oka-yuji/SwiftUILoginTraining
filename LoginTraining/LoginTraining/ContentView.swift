//
//  ContentView.swift
//  LoginTraining
//
//  Created by 岡優志 on 2021/04/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LoginView()
        .environmentObject(FlagViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
