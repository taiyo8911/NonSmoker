//
//  SettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: DateSettingView()) {
                        Text("日時設定")
                    }
                    NavigationLink(destination: RecordsView()) {
                        Text("カルテ設定")
                    }
                    // リセットボタン
                    Button(action: {
                        // リセット処理
                    }) {
                        Text("リセット")
                            .foregroundColor(.red)
                    }
                }
            }
            // タイトル
            .navigationBarTitle("設定")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
