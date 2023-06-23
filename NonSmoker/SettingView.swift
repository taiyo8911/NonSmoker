//
//  SettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/06/13.
//

import SwiftUI

struct SettingView: View {
    // 初期値の設定
    // 禁煙開始日
    @AppStorage("startYear") var startYear: Int = Calendar.current.component(.year, from: Date())
    @AppStorage("startMonth") var startMonth: Int = Calendar.current.component(.month, from: Date())
    @AppStorage("startDay") var startDay: Int = Calendar.current.component(.day, from: Date())
    @AppStorage("startHour") var startHour: Int = Calendar.current.component(.hour, from: Date())
    @AppStorage("startMinute") var startMinute: Int = Calendar.current.component(.minute, from: Date())
    @AppStorage("startSecond") var startSecond: Int = 0
    
    @AppStorage("numberPerDay") var numberPerDay = 10 // 1日の喫煙本数
    @AppStorage("pricePerBox") var pricePerBox = 600 // 1箱の値段
    @AppStorage("numberPerBox") var numberPerBox = 20 // 1箱の本数
    
    // 選択された日付
    @State var selectedDate = Date()
    
    // モーダルを閉じるフラグ
    @Binding var isShowSetting: Bool
    
    // 設定が完了したら値を保存してメイン画面に戻るフラグ
    @Binding var isSettingCompleted: Bool
        
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "禁煙開始日",
                    selection: $selectedDate
                )
                .datePickerStyle(CompactDatePickerStyle())
                .clipped()
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fontWeight(.bold)
                
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
                
                Group {
                    Text("1日何本吸っていましたか？")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Stepper(value: $numberPerDay, in: 1...99, step: 1) {
                        Text("\(UserDefaults.standard.integer(forKey: "numberPerDay"))本")
                    }
                }
                
                Group {
                    Text("1箱の値段は？")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Stepper(value: $pricePerBox, in: 200...990, step: 10) {
                        Text("\(UserDefaults.standard.integer(forKey: "pricePerBox"))円")
                    }
                }
                
                Group {
                    Text("1箱の本数は？")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Stepper(value: $numberPerBox, in: 10...40, step: 1) {
                        Text("\(UserDefaults.standard.integer(forKey: "numberPerBox"))本")
                    }
                }
                
                // 保存ボタン
                Button(action: {
                    // モーダルを閉じる
                    isShowSetting = false
                    
                    // 保存処理
                    UserDefaults.standard.set(numberPerDay, forKey: "numberPerDay")
                    UserDefaults.standard.set(pricePerBox, forKey: "pricePerBox")
                    UserDefaults.standard.set(numberPerBox, forKey: "numberPerBox")
                    
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: selectedDate)
                    UserDefaults.standard.set(components.year, forKey: "startYear")
                    UserDefaults.standard.set(components.month, forKey: "startMonth")
                    UserDefaults.standard.set(components.day, forKey: "startDay")
                    UserDefaults.standard.set(components.hour, forKey: "startHour")
                    UserDefaults.standard.set(components.minute, forKey: "startMinute")
                    
                    // 設定完了フラグを立ててメイン画面を表示する
                    //                    UserDefaults.standard.set(true, forKey: "isSettingCompleted")
                    
                    isSettingCompleted = true
                }) {
                    Text("保存")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("設定")
            .padding()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isShowSetting: .constant(true), isSettingCompleted: .constant(false))
    }
}
