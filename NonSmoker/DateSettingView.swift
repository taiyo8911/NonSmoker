//
//  DateSettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct DateSettingView: View {
    var body: some View {
        VStack {
            Text("日時設定")
                .font(.title)
            
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
        }
    }
}

struct DateSettingView_Previews: PreviewProvider {
    static var previews: some View {
        DateSettingView()
    }
}
