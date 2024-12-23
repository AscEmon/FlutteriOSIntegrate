//
//  ContentView.swift
//  FlutteriOSIntegrate
//
//  Created by Abu Sayed Chowdhury on 12/23/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}


import SwiftUI
import Flutter

//struct FlutterView: UIViewControllerRepresentable {
//    let flutterEngine: FlutterEngine
//
//    func makeUIViewController(context: Context) -> FlutterViewController {
//        print("FlutterViewController initialized")
//        return FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//    }
//
//    func updateUIViewController(_ uiViewController: FlutterViewController, context: Context) {}
//}

struct FlutterView: View {
    let flutterEngine: FlutterEngine
    
    var body: some View {
        FlutterViewControllerWrapper(flutterEngine: flutterEngine)
            .edgesIgnoringSafeArea(.all)
    }
}

struct FlutterViewControllerWrapper: UIViewControllerRepresentable {
    let flutterEngine: FlutterEngine
    
    func makeUIViewController(context: Context) -> FlutterViewController {
        // Initialize the Flutter view controller
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        return flutterViewController
    }
    
    func updateUIViewController(_ uiViewController: FlutterViewController, context: Context) {
        // No update needed, but this method is required.
    }
}
