//
//  LoadingView.swift
//  LoginTraining
//
//  Created by 岡優志 on 2021/04/11.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading")
                .frame(width: 100, height: 100)
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
