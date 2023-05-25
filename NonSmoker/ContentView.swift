//
//  ContentView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct ContentView: View {
    
    // 配列を定義
    let dataTitle = [
        "MESSAGE",
        "TIME",
        "NUMBER",
        "PRICE",
        "LIFE",
    ]
    
    var data = [
        "hello",
        "3days 12hour",
        "10",
        "300",
        "1days",
    ]
    
    var body: some View {
        NavigationView {
            
            VStack {
                // 上部ボタン
                NavigationLink(destination: SettingView()) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                    Spacer()
                }
                
                Spacer()
                
                // データ表示
                List {
                    Text(dataTitle[0])
                        .fontWeight(.bold)
                        .listRowBackground(Color.green)
                    
                    Label(
                        title: {
                            Text(dataTitle[1] + ":")
                                .fontWeight(.bold)
                            Text(data[1])
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        },
                        icon: {
                            Image(systemName: "stopwatch")
                        }
                    )
                    .listRowBackground(Color.green)
                    
                    Label(
                        title: {
                            Text(dataTitle[2] + ":")
                                .fontWeight(.bold)
                            Text(data[2])
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        },
                        icon: {
                            Image(systemName: "number")
                        }
                    )
                    .listRowBackground(Color.green)
                    
                    
                    Label(
                        title: {
                            Text(dataTitle[3] + ":")
                                .fontWeight(.bold)
                            Text(data[3])
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .trailing)

                        },
                        icon: {
                            Image(systemName: "dollarsign")
                        }
                    )
                    .listRowBackground(Color.green)
                    
                    Label(
                        title: {
                            Text(dataTitle[4] + ":")
                                .fontWeight(.bold)
                            Text(data[4])
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        },
                        icon: {
                            Image(systemName: "heart")
                        }
                    )
                    .listRowBackground(Color.green)
                }
                
                // 下部ボタン
                HStack {
                     Button(action: {
                         // ボタンを押した時の動作
                         print("ScreenShot")
                     }) {
                         Text("ScreenShot")
                     }
                     .padding()
                     
                    
                    Button(action: {
                        // ボタンを押した時の動作
                        print("twitter")
                    }) {
                        Text("Twitter")
                    }
                    .padding()
                    
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
