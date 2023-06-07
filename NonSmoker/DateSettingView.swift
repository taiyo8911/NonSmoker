//
//  DateSettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct DateSettingView: View {
    // モーダル表示フラグ
    @Binding var isShowDateSetting: Bool

    // 選択された日付
    @State var selectedDate = Date()

    // AppStorageの初期値
    @AppStorage("startYear") var startYear: Int = 2023
    @AppStorage("startMonth") var startMonth: Int = 2
    @AppStorage("startDay") var startDay: Int = 1
    @AppStorage("startHour") var startHour: Int = 0
    @AppStorage("startMinute") var startMinute: Int = 0
    

    var body: some View {
        NavigationView {
            VStack {
                Text("\(selectedDate)")
                    .font(.body)
                    .padding()
                
                // 選択した値をselectedDateとする
                DatePicker(
                    "禁煙開始日",
                    selection: $selectedDate
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .environment(\.locale, Locale(identifier: "ja_JP"))
                // 表示されたらAppStorageの値を読み込ん表示する
                .onAppear {
                    let components = DateComponents(
                        calendar: Calendar.current,
                        timeZone: TimeZone.current,
                        year: startYear,
                        month: startMonth,
                        day: startDay,
                        hour:startHour,
                        minute: startMinute
                    )
                    selectedDate = components.date!
                }

                // 保存ボタン
                Button(action: {
                    // モーダルを閉じる
                    self.isShowDateSetting = false

                    // 選択した日付をAppStorageに保存
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: selectedDate)
                    startYear = components.year!
                    startMonth = components.month!
                    startDay = components.day!
                    startHour = components.hour!
                    startMinute = components.minute!
                }) {
                    Text("保存")
                        .frame(width: 200, height: 60)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("禁煙開始日")
        }
    }
}

struct DateSettingView_Previews: PreviewProvider {
    static var previews: some View {
        DateSettingView(isShowDateSetting: .constant(false))
    }
}
