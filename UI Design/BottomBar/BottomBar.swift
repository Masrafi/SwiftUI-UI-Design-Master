import SwiftUI

// Step 1: Define an Enum for Tabs
enum Tab {
    case home
    case favorites
    case messages
    case cart
}

struct BottomBar: View {
    // Step 2: Use a @State Variable to Manage Selected Tab
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            Spacer()
            // Step 3: Conditionally Display Views
            ZStack {
                switch selectedTab {
                case .home:
                    NavOne()
                case .favorites:
                    NavTwo()
                case .messages:
                    NavThree()
                case .cart:
                    NavFour()
                }
            }
            Spacer()
            // Step 4: Custom Bottom Bar
            BottomNavigationBarViewIMP(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom) // Ensure the bottom bar is at the bottom
    }
}

#Preview {
    BottomBar()
}

struct BottomNavigationBarViewIMP: View {
    // Bind the selected tab
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Button(action: {
                selectedTab = .home
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(selectedTab == .home ? .blue : .gray)
                    Text("Home")
                        .font(.caption)
                        .foregroundColor(selectedTab == .home ? .blue : .gray)
                }
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                selectedTab = .favorites
            }) {
                VStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(selectedTab == .favorites ? .blue : .gray)
                    Text("Favorites")
                        .font(.caption)
                        .foregroundColor(selectedTab == .favorites ? .blue : .gray)
                }
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                selectedTab = .messages
            }) {
                VStack {
                    Image(systemName: "message.fill")
                        .foregroundColor(selectedTab == .messages ? .blue : .gray)
                    Text("Messages")
                        .font(.caption)
                        .foregroundColor(selectedTab == .messages ? .blue : .gray)
                }
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                selectedTab = .cart
            }) {
                VStack {
                    Image(systemName: "cart.fill")
                        .foregroundColor(selectedTab == .cart ? .blue : .gray)
                    Text("Cart")
                        .font(.caption)
                        .foregroundColor(selectedTab == .cart ? .blue : .gray)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color.green)
        .cornerRadius(15)
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y:6)
        .padding(.bottom, 20)
    }
}
