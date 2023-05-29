//
//  DateSettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct DateSettingView: View {
    var body: some View {
        NavigationView {
            VStack {
                // カレンダーを表示する
                DatePicker("", selection: .constant(Date()), displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(width: 300, height: 300)

                // 保存ボタン
                Button(action: {
                    // 保存処理
                }) {
                    Text("保存")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("日時設定")
        }
    }
}

struct DateSettingView_Previews: PreviewProvider {
    static var previews: some View {
        DateSettingView()
    }
}
