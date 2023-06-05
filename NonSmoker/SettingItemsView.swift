//
//  SettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct SettingItemsView: View {
    // 日時設定画面遷移フラグ
    @State private var isShowDateSetting = false
    
    // その他設定画面遷移フラグ
    @State private var isShowRecords = false
    
    // アラート表示フラグ
    @State private var isShowAlert = false
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    isShowDateSetting.toggle()
                } label: {
                    Text("日時設定")
                        .padding()
                }
                .sheet(isPresented: $isShowDateSetting) {
                    DateSettingView(isShowDateSetting: $isShowDateSetting)
                }
                
                Button {
                    isShowRecords.toggle()
                
                } label: {
                    Text("その他設定")
                        .padding()
                }
                .sheet(isPresented: $isShowRecords) {
                    RecordsSettingView(isRecordsShow: $isShowRecords)
                }
                                
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
                        title: Text("リセットしますか？"),
                        primaryButton: .cancel(Text("キャンセル")),
                        secondaryButton: .destructive(Text("リセット"),
                                                      action:
                                                        {
                                                            print("リセット")
                                                            let appDomain = Bundle.main.bundleIdentifier
                                                            UserDefaults.standard.removePersistentDomain(forName: appDomain!)
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
