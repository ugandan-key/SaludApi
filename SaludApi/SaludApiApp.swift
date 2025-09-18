//
//  SaludApiApp.swift
//  SaludApi
//
//  Created by Geovany Monroy Garcia on 4/10/24.
//

import SwiftUI

@main
struct SaludApiApp: App {
    init() {
        NotificationManager.shared.requestAuthorization()
        NotificationManager.shared.schedulePreventionNotification()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if url.scheme == "saludapi" {
                        print("App opened with URL: \(url)")
                    }
                }
        }
    }
}
