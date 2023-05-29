//
//  SettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct SettingView: View {
    // アラート表示のフラグ
    @State private var showAlert = false
    
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
//                    Button(action: {
//                        // リセット処理
//                        showAlert = true
//
//                    }) {
//                        Text("リセット")
//                            .foregroundColor(.red)
//                    }
//                    .alert(isPresented: $showAlert) {
//                        Alert(
//                            title: Text("リセットしますか？"),
//                            message: Text("リセットすると、全てのデータが削除されます。"),
//                            dismissButton: .default(
//                                Text("OK"),
//                                action: {
//                                    // OKボタンが押されたときの処理を追加
//                                    print("OKボタンが押されました")
//                                }
//                            )
//                        )
//                    }
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
