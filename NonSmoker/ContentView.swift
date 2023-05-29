//
//  ContentView.swift
//  NonSmoker
//
//  Created by Taiyo Koshiba on 2023/05/25.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        guard let image = takeScreenshot() else {
            fatalError("スクリーンショットの取得に失敗しました。")
        }

        let text = "スクリーンショットを共有します。"
        let items: [Any] = [text, image]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return activityVC
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
    }

    private func takeScreenshot() -> UIImage? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(bounds: window.bounds)
        let image = renderer.image { _ in
            window.drawHierarchy(in: window.bounds, afterScreenUpdates: false)
        }

        return image
    }
}


struct ContentView: View {
    // シェア画面表示フラグ
    @State private var isShowingShareSheet = false
        
    var body: some View {
        NavigationView {
            VStack {
                // アプリ名
                Text("You're NonSmoker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // 上部ボタン
                NavigationLink(destination: SettingView()) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                    Spacer()
                }
                
                Spacer()
                
                DataView()
                
                
                // シェアボタン
                Button(action: {
                    // シェアシート表示フラグ
                    isShowingShareSheet = true
                }) {
                    Text("Share")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                    
                }
                .padding()
                
            }
            .sheet(isPresented: $isShowingShareSheet) {
                ShareSheet()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
