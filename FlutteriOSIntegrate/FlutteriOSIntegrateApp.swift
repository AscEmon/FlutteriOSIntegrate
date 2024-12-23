//
//  FlutteriOSIntegrateApp.swift
//  FlutteriOSIntegrate
//
//  Created by Abu Sayed Chowdhury on 12/23/24.
//

//import SwiftUI
//import Flutter
//@main
//struct FlutteriOSIntegrateApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


import SwiftUI
import Flutter
import Foundation


@main
struct FlutteriOSIntegrateApp: App {
    // Use ObservableFlutterEngine
    @StateObject private var flutterEngine = ObservableFlutterEngine()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flutterEngine)
        }
    }
 
}


struct ContentView: View {
    @EnvironmentObject var flutterEngine: ObservableFlutterEngine
    @State private var showFlutterScreen = false

    var body: some View {
        NavigationView {
            VStack {
                Button("Open Flutter Screen") {
                    showFlutterScreen.toggle()
                }
                .sheet(isPresented: $showFlutterScreen) {
                    FlutterView(flutterEngine: flutterEngine.engine)
                }
            }
            .navigationTitle("SwiftUI & Flutter")
        }
    }
}









class ObservableFlutterEngine: ObservableObject {
    let engine: FlutterEngine

    init() {
        // Initialize the Flutter engine
        engine = FlutterEngine()
        let success = engine.run()
              if success {
                  print("Flutter engine started successfully")
              } else {
                  print("Failed to start Flutter engine")
              }
    }
}
