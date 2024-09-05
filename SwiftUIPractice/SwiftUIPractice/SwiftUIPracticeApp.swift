//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Raihan on 13/7/24.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct SwiftUIPracticeApp: App {
    init() {
        requestNotificationPermission()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Person.self)
    }
    
    func requestNotificationPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if granted {
                    print("Notification permission granted.")
                } else if let error = error {
                    print("Error requesting notification permission: \(error)")
                }
            }
        }
}
