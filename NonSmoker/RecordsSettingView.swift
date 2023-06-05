//
//  RecordsView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct RecordsSettingView: View {
    // 1日の本数
//    @State private var numberPerDay: Int = 12
    
    // 一箱の値段
//    @State private var pricePerBox: Int = 600
    
    
    // モーダルを閉じるための変数
    @Binding var isRecordsShow: Bool

    // 1日の喫煙本数
    @AppStorage("numberPerDay_key") var numberPerDay: Int = 9
    
    // 1箱の値段
    @AppStorage("pricePerBox_key") var pricePerBox: Int = 599
    
    // 1箱の本数
    @AppStorage("numberPerBox_key") var numberPerBox: Int = 19
    
        
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Text("1日何本吸っていましたか？")
                        .font(.title2)
                    
                    Stepper(value: $numberPerDay, in: 1...99, step: 1) {
//                        Text("\(numberPerDay)本")
                        Text("\(UserDefaults.standard.integer(forKey: "numberPerDay_key"))")
                    }
                }
                .padding()
                
                
                Group {
                    Text("1箱の値段は？")
                        .font(.title2)
                    
                    Stepper(value: $pricePerBox, in: 200...990, step: 10) {
//                        Text("\(pricePerBox)円")
                        Text("\(UserDefaults.standard.integer(forKey: "pricePerBox_key"))円")
                    }
                }
                .padding()
                
                
                Group {
                    Text("1箱の本数は？")
                        .font(.title2)
                    
                    Stepper(value: $numberPerBox, in: 10...40, step: 1) {
//                        Text("\(pricePerBox)円")
                        Text("\(UserDefaults.standard.integer(forKey: "numberPerBox_key"))本")
                    }
                }
                .padding()
                
                
                
                // 保存ボタン
                Button(action: {
                    // モーダルを閉じる
                    isRecordsShow   = false
                    // 保存処理
                    UserDefaults.standard.set(numberPerDay, forKey: "numberPerDay")
                    UserDefaults.standard.set(pricePerBox, forKey: "pricePerBox")
                    UserDefaults.standard.set(numberPerBox, forKey: "numberPerBox")

                }) {
                    Text("保存")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("その他設定")
    }
}

//struct RecordsSettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordsSettingView()
//    }
//}
