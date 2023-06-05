//
//  DateSettingView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct DateSettingView: View {
    
    // 選択された日付
    @State var selectedDate = Date()
    
    // 日付をフォーマットする関数
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    // 選択した日付と現在時刻の差分を計算する関数
    func timeDifference(_ selectedDate: Date, _ currentDate: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: selectedDate, to: currentDate)
        
        guard let days = components.day,
              let hours = components.hour,
              let minutes = components.minute else {
            return "Invalid date"
        }
        
        return String(format: "%02dd %02dh %02dm", days, hours, minutes)
    }
    
    // モーダルを閉じるための変数
    @Binding var isShowDateSetting: Bool
        
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    selection: $selectedDate,
                    label: { Text("禁煙開始日") }
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .padding()
                
                
                
                Text("Selected Date: \(formattedDate(selectedDate))")
                Text("Time Difference: \(timeDifference(selectedDate, Date()))")
                
                
                // 保存ボタン
                Button(action: {
                    // モーダルを閉じる
                    self.isShowDateSetting = false
                    // 保存処理(AppStorage)
                    UserDefaults.standard.set(selectedDate, forKey: "selectedDate")
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

//struct DateSettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        DateSettingView()
//    }
//}
