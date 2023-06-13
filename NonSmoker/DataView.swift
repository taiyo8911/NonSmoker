//
//  DataView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/27.
//

import SwiftUI

struct DataView: View {
    
    @AppStorage("startYear") var startYear = Calendar.current.component(.year, from: Date())
    @AppStorage("startMonth") var startMonth = Calendar.current.component(.month, from: Date())
    @AppStorage("startDay") var startDay = Calendar.current.component(.day, from: Date())
    @AppStorage("startHour") var startHour = Calendar.current.component(.hour, from: Date())
    @AppStorage("startMinute") var startMinute = Calendar.current.component(.minute, from: Date())
    @AppStorage("startSecond") var startSecond = 0
    
    
    
    // 禁煙開始日
    private var startDate: Date {
        Calendar.current.date(from: DateComponents(year: startYear, month: startMonth, day: startDay, hour: startHour, minute: startMinute, second: startSecond)) ?? Date()
    }
    
    // 経過時間
    @State private var elapsedTime: String = ""
    
    func updateElapsedTime() {
        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: startDate, to: Date())
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        elapsedTime = String(format: "%02dd %02dh %02dm %02ds", days, hours, minutes, seconds)
    }
    
    
    // 禁煙本数
    @State private var nonSmokingCount: Int = 0
    
    func updateNonSmokingCount() {
        // 1日に吸っていた本数
        let numberPerDay = UserDefaults.standard.integer(forKey: "numberPerDay")
        // 経過日数
        let days = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
        nonSmokingCount = Int(numberPerDay * days)
    }
    
    // 節約金額
    @State private var savedMoney: Int = 0
    
    func updateSavedMoney() {
        // 1箱の値段
        let pricePerBox = UserDefaults.standard.integer(forKey: "pricePerBox")
        // 1箱の本数
        let numberPerBox = UserDefaults.standard.integer(forKey: "numberPerBox")
        // 1本あたりの値段
        if numberPerBox == 0 {
            return
        }
        
        let pricePerOne = pricePerBox / numberPerBox
        savedMoney = pricePerOne * nonSmokingCount
    }
    
    
    var body: some View {
        // データ表示
        VStack {
            // 経過時間を表示
            Label(
                title: {
                    Text("\(elapsedTime)")
                        .font(Font(UIFont.monospacedSystemFont(ofSize: 15, weight: .bold)))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("⏰")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            )
            .padding()
            
            // 本数を表示
            Label(
                title: {
                    Text("\(nonSmokingCount) cigs")
                        .font(Font(UIFont.monospacedSystemFont(ofSize: 16, weight: .bold)))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("🚬")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            )
            .padding()
            
            
            // 節約できた金額表示
            Label(
                title: {
                    Text("\(savedMoney) yen")
                        .font(Font(UIFont.monospacedSystemFont(ofSize: 16, weight: .bold)))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("💲")
                }
            )
            .padding()
            
            
        }
        // ビューが描画されたら
        .onAppear {
            // 1秒おきに値を更新する
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                updateElapsedTime()
                updateNonSmokingCount()
                updateSavedMoney()
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
