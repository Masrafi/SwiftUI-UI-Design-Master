import SwiftUI
import UserNotifications

struct ScheduleNotification: View {
    init() {
        dispatchNotification()
    }
    @StateObject var delegate = NotificationDelegate()  // Initialization
    var body: some View {
        VStack{
            
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
    
    // For forground mood
    class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
        
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.badge, .banner, .sound])
        }
    }
    
    //Schedule notification
    func dispatchNotification() {
        let identifier = "my-morning-notification"
        let title = "Time to work our!"
        let body = "Don't be a lazy little butt!"
        let hour = 21
        let minute = 5
        let isDaily = true
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calender = Calendar.current
        var dateComponents = DateComponents(calendar: calender, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }

}
#Preview {
    ScheduleNotification()
}
