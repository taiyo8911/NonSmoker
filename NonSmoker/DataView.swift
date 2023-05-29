//
//  DataView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/27.
//

import SwiftUI

struct DataView: View {
    
    // メッセージ
    let messages = [
        "禁煙は健康への第一歩！",
        "吸わない自分に誇りを！",
        "タバコを断って自由に！",
        "禁煙は新たな始まり！",
        "たばこなし、明るい未来！",
        "タバコを忘れて笑おう！",
        "禁煙で新しい自分へ！",
        "煙を消し、健康を手に！",
        "未来のために禁煙しよう！",
        "タバコはさよなら、元気をハロー！"
    ]
    
    // カレンダー
    private let calendar = Calendar.current
    // 禁煙開始日
    private let dateComponents = DateComponents(year: 2023, month: 2, day: 1, hour: 0, minute: 0)
    
    
    // 経過時間の計算
    private func calculateElapsedTime() -> String {
        let date = calendar.date(from: dateComponents) ?? Date()
        let now = Date()
        
        let components = calendar.dateComponents([.day, .hour, .minute], from: date, to: now)
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        
        return String(format: "%02dd %02dh %02dm", days, hours, minutes)
    }
    
    
    
    // 禁煙できた本数の計算
    private func calculateNonSmokingCount() -> Int {
        // 1日に吸っていた本数
        let numberPerDay = 12
        // 経過日数
        let date = calendar.date(from: dateComponents) ?? Date()
        let days = calendar.dateComponents([.day], from: date, to: Date()).day ?? 0
        // 禁煙本数
        return numberPerDay * days
    }
    
    
    // 節約できた金額の計算
    private func money() -> Int {
        // 一箱の値段
        let price = 600
        // 一箱の本数
        let numberPerBox = 20
        // 1本あたりの値段
        let pricePerOne = price / numberPerBox
        // 節約金額
        return pricePerOne * calculateNonSmokingCount()
    }
    
    
    // 延びた寿命の計算
    private func calculateExtendedLife() -> Int {
        // 1本吸うごとに減る寿命
        let lifespanPerCigarette = 5
        // 1日に吸っていた本数
        let cigarettesPerDay = 12
        // 経過日数
        let date = calendar.date(from: dateComponents) ?? Date()
        let days = calendar.dateComponents([.day], from: date, to: Date()).day ?? 0
        // 延びた寿命（分）
        let extendedLifespan = lifespanPerCigarette * cigarettesPerDay * days
        // 延びた寿命（時間）
        let extendedLifeInHours = extendedLifespan / 60
        
        return extendedLifeInHours
    }
    
    
    var body: some View {
        // データ表示
        List {
            // メッセージをランダムに表示
            Text(messages.randomElement()!)
                .fontWeight(.bold)
                .listRowBackground(Color.green)
            
            // 経過時間を表示
            Label(
                title: {
                    Text("\(calculateElapsedTime())")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("⏰")
                }
            )
            .listRowBackground(Color.green)
            
            // 本数を表示
            Label(
                title: {
                    Text("\(calculateNonSmokingCount()) cigs")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("🚬")
                }
            )
            .listRowBackground(Color.green)
            
            
            // 節約できた金額表示
            Label(
                title: {
                    Text("\(money()) yen")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                },
                icon: {
                    Text("💲")
                }
            )
            .listRowBackground(Color.green)
            
            // 延びた寿命を表示
            Label(
                title: {
                    Text("\(calculateExtendedLife()) hours")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                },
                icon: {
                    Text("💓")
                }
            )
            .listRowBackground(Color.green)
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
