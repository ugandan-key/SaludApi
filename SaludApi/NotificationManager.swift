import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    private init() {}
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
            print("Notification permission granted: \(granted)")
        }
    }
    
    func schedulePreventionNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Medida de prevención"
        content.body = NotificationManager.randomRecommendation()
        content.sound = .default
        
        // Notificación diaria a las 9:00 AM
        var dateComponents = DateComponents()
        dateComponents.hour = 9
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
    
    static func randomRecommendation() -> String {
        let recommendations = [
            "Recuerda lavarte las manos frecuentemente.",
            "Usa cubrebocas en lugares concurridos.",
            "Mantén una distancia segura de otras personas.",
            "Ventila los espacios cerrados con frecuencia."
        ]
        return recommendations.randomElement() ?? "Cuida tu salud."
    }
}
