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
        // 初期設定が完了している場合はメイン画面を表示
        if isSettingCompleted {
            MainView()
        } else { // 初期設定が完了していない場合は初期設定画面を表示
            SettingView(isShowSetting: .constant(true), isSettingCompleted: $isSettingCompleted)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
