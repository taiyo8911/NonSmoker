//
//  RecordsView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct RecordsView: View {
    var body: some View {
        VStack {
            Text("カルテ設定")
                .font(.title)
                        
            // 1日何本吸っていましたか？
            Text("1日何本吸っていましたか？")
                .font(.title2)
            Text("4本")
            
            // 1箱の値段は？
            Text("1箱の値段は？")
                .font(.title2)
            Text("500円")
            
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

struct RecordsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordsView()
    }
}
