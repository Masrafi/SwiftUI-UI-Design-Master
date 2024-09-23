import Foundation
import CoreLocation

class CurrentLocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var latitude: Double = 0.0
       @Published var longitude: Double = 0.0
       @Published var errorMessage: String? = nil
       @Published var isCurrentLocation: Bool = false
    
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.requestWhenInUseAuthorization()
    }
    
    func requestCurrentLocation() {
            isCurrentLocation = true
            locationManager?.requestLocation()
        }
        
        // CLLocationManagerDelegate method
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                self.latitude = location.coordinate.latitude
                self.longitude = location.coordinate.longitude
                self.errorMessage = nil
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            self.errorMessage = "Failed to get current location: \(error.localizedDescription)"
        }
}

