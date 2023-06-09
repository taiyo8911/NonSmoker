//
//  SettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/06/09.
//

import SwiftUI

struct SettingView: View {
    // モーダル表示フラグ
    @Binding var isShowSetting: Bool

    // 1日の喫煙本数
    @AppStorage("numberPerDay_key") var numberPerDay: Int = 9
    
    // 1箱の値段
    @AppStorage("pricePerBox_key") var pricePerBox: Int = 590
    
    // 1箱の本数
    @AppStorage("numberPerBox_key") var numberPerBox: Int = 19
    
    
    // AppStorageの初期値
    @AppStorage("startYear") var startYear: Int = 2023
    @AppStorage("startMonth") var startMonth: Int = 2
    @AppStorage("startDay") var startDay: Int = 1
    @AppStorage("startHour") var startHour: Int = 0
    @AppStorage("startMinute") var startMinute: Int = 0
    
    // 選択された日付
    @State var selectedDate = Date()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Text("禁煙開始日")
                        .font(.title2)
                    
                    // 選択した値をselectedDateとする
                    DatePicker(
                        "",
                        selection: $selectedDate
                    )
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
                    .clipped()
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    // ビューが表示されたらAppStorageの値を読み込んで表示する
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
                }
                .padding()
                
                Group {
                    Text("1日何本吸っていましたか？")
                        .font(.title2)

                    Stepper(value: $numberPerDay, in: 1...99, step: 1) {
                        Text("\(UserDefaults.standard.integer(forKey: "numberPerDay_key"))本")
                    }
                }
                .padding()
                
                
                Group {
                    Text("1箱の値段は？")
                        .font(.title2)
                    
                    Stepper(value: $pricePerBox, in: 200...990, step: 10) {
                        Text("\(UserDefaults.standard.integer(forKey: "pricePerBox_key"))円")
                    }
                }
                .padding()
                
                
                Group {
                    Text("1箱の本数は？")
                        .font(.title2)
                    
                    Stepper(value: $numberPerBox, in: 10...40, step: 1) {
                        Text("\(UserDefaults.standard.integer(forKey: "numberPerBox_key"))本")
                    }
                }
                .padding()
                
                
                // 保存ボタン
                Button(action: {
                    // モーダルを閉じる
                    isShowSetting = false
                    // 保存処理
                    UserDefaults.standard.set(numberPerDay, forKey: "numberPerDay")
                    UserDefaults.standard.set(pricePerBox, forKey: "pricePerBox")
                    UserDefaults.standard.set(numberPerBox, forKey: "numberPerBox")
                    
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
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("各種設定")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isShowSetting: .constant(true))
    }
}
