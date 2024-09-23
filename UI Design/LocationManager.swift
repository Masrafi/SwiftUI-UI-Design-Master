import CoreLocation
import CoreLocation

class LocationViewModel: ObservableObject {
    @Published var placeName: String = ""
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    @Published var errorMessage: String? = nil
    
    private var geocoder = CLGeocoder()
    
    func fetchCoordinates() {
        geocoder.geocodeAddressString(placeName) { [weak self] (placemarks, error) in
            if let error = error {
                self?.errorMessage = "Error: \(error.localizedDescription)"
                return
            }
            
            if let placemark = placemarks?.first,
               let location = placemark.location {
                self?.latitude = location.coordinate.latitude
                self?.longitude = location.coordinate.longitude
                self?.errorMessage = nil
            } else {
                self?.errorMessage = "Location not found"
            }
        }
    }
}
