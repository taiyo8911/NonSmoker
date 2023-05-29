//
//  RecordsView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct RecordsView: View {
    // 1日の本数
    @State private var numberPerDay: Int = 12
    
    // 一箱の値段
    @State private var pricePerBox: Int = 600
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Text("1日何本吸っていましたか？")
                        .font(.title2)
                    
                    Stepper(value: $numberPerDay, in: 1...99, step: 1) {
                        Text("\(numberPerDay)本")
                    }
                    .padding()
                    
                    
                    Text("一箱の値段は？")
                        .font(.title2)
                    
                    Stepper(value: $pricePerBox, in: 200...990, step: 10) {
                        Text("\(pricePerBox)円")
                    }
                    .padding()
                }
                
                
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
        .navigationTitle("カルテ設定")
    }
}

struct RecordsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordsView()
    }
}
