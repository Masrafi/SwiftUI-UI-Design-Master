import SwiftUI
import UserNotifications

struct LocalNotification: View {
    @StateObject var delegate = NotificationDelegate() // Initialization
    var body: some View {
        VStack{
           Button(action: {
                scheduleTriggerNotification(title: "Title", body: "This is body")
            }, label: {
                Text("Send notification")
            })
        }.onAppear{
            //Notification permission
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {success, error in
                if success {
                    print("Permission granted")
                } else if let error {
                    print(error.localizedDescription)
                }
            }
            UNUserNotificationCenter.current().delegate = delegate
        }
    }
}

#Preview {
    LocalNotification()
}

// For forgraoun mood
class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .sound])
    }
}
//Local Notification
func scheduleTriggerNotification(title: String, body: String) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default
    content.badge = 1  // this show notification count number on the app iscon
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}
