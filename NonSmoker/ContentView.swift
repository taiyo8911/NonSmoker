//
//  ContentView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct ContentView: View {
    // 初期設定がされているか判定するフラグ
    @AppStorage("isSettingCompleted") var isSettingCompleted: Bool = false
    
    var body: some View {
        if isSettingCompleted {
            MainView()
        } else {
            SettingView(isShowSetting: .constant(true), isSettingCompleted: $isSettingCompleted)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
