//
//  ContentView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct ContentView: View {
    // 設定画面表示フラグ
    @State private var isShowingSettingListView = false
    
    // シェア画面表示フラグ
    @State private var isShowingShareSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // 背景を塗りつぶす
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                //　ビューを縦並びに配置
                VStack {
                    // ビューを横並びに配置
                    HStack   {
                        Spacer()
                        // ナビゲーション
                        NavigationLink(destination: SettingItemsView()) {
                            Image(systemName: "ellipsis")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(8.0)
                                .padding()
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text("NS365")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    // 詳細データ
                    DataView()
                        .frame(width: 350)
                        .foregroundColor(.white)
                        .border(Color.white, width: 3)
                        .padding()
                    
                    Spacer()
                    
                    // シェアボタン
                    Button(action: {
                        // シェア画面表示フラグ
                        isShowingShareSheet = true
                    }) {
                        Text("Share")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.white.opacity(0.1))
                            .border(Color.white, width: 2)
                            .cornerRadius(8.0)
                            .padding()
                    }
                    .padding()
                    
                    Spacer()
                }
                // シェア画面をモーダル表示
                .sheet(isPresented: $isShowingShareSheet) {
                    ShareSheet()
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
