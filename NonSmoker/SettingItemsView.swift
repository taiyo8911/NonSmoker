//
//  SettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct SettingItemsView: View {
    // アラート表示フラグ
    @State private var isShowAlert = false

    // 設定画面の表示フラグ
    @State private var isShowSetting = false

    // 設定完了フラグ
    @State private var isSettingCompleted = false

    var body: some View {
        NavigationView {
            List {
                // 各種設定ボタン
                Button {
                    isShowSetting.toggle()
//                    isSettingCompleted.toggle()
                } label: {
                    Text("各種設定")
                        .padding()
                }
                .sheet(isPresented: $isShowSetting) {
                    SettingView(isShowSetting: $isShowSetting, isSettingCompleted: $isSettingCompleted)
                }
                

                // リセットボタン
                Button {
                    isShowAlert = true
                } label: {
                    Text("設定リセット")
                        .padding()
                        .foregroundColor(.red)
                }
                // アラート表示
                .alert(isPresented: $isShowAlert) {
                    Alert(
                        title: Text("リセットしますか？"), primaryButton: .cancel(Text("キャンセル")), secondaryButton: .destructive(Text("リセット"), action:{
                    
                            // リセット処理
                            // ユーザーデフォルトを削除する
                            let appDomain = Bundle.main.bundleIdentifier
                            UserDefaults.standard.removePersistentDomain(forName: appDomain!)
                            
                            // デフォルト値を再設定する
                            UserDefaults.standard.set(10, forKey: "numberPerDay")
                            UserDefaults.standard.set(600, forKey: "pricePerBox")
                            UserDefaults.standard.set(20, forKey: "numberPerBox")
                            UserDefaults.standard.set(Calendar.current.component(.year, from: Date()), forKey: "startYear")
                            UserDefaults.standard.set(Calendar.current.component(.month, from: Date()), forKey: "startMonth")
                            UserDefaults.standard.set(Calendar.current.component(.day, from: Date()), forKey: "startDay")
                            UserDefaults.standard.set(Calendar.current.component(.hour, from: Date()), forKey: "startHour")
                            UserDefaults.standard.set(Calendar.current.component(.minute, from: Date()), forKey: "startMinute")
                            UserDefaults.standard.set(0, forKey: "startSecond")
                            
//                            UserDefaults.standard.set(false, forKey: "isSettingCompleted")
                        })
                    )
                }
            }
            .navigationTitle("設定")
        }
    }
}

struct SettingItemsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingItemsView()
    }
}
