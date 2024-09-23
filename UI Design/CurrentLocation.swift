import SwiftUI
import CoreLocationUI

struct CurrentLocation: View {
    @StateObject private var viewModel = LocationViewModel()
    @StateObject private var viewModelCurrent = CurrentLocationViewModel()
    var body: some View {
        VStack(spacing: 20) {
                    TextField("Enter place name", text: $viewModel.placeName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        viewModel.fetchCoordinates()
                    }) {
                        Text("Get Coordinates")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        Text("Latitude: \(viewModel.latitude)")
                        Text("Longitude: \(viewModel.longitude)")
                    }
            
            //Get current location
            
            Button(action: {
                viewModelCurrent.requestCurrentLocation()
                        }) {
                            Text("Get Current Location")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
            
            // Display error or location data
                        if let errorMessage = viewModelCurrent.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                        } else {
                            Text("Latitude: \(viewModelCurrent.latitude)")
                            Text("Longitude: \(viewModelCurrent.longitude)")
                        }
                }
                .padding()
    }
}

#Preview {
    CurrentLocation()
}
