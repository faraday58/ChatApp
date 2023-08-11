//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Armando Rodríguez on 10/08/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct ChatAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
