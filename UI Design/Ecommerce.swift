//
//  Ecommerce.swift
//  UI Design
//
//  Created by Md Khorshed Alam on 20/9/24.
//

import SwiftUI

struct Ecommerce: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Casual", "Denim", "Aloah", "Button", "Cowboy"]
    @State private var search: String = ""
    
    @State var gridLayout = [GridItem(.adaptive(minimum: 100)), GridItem(.flexible())]
    var body: some View {
        GeometryReader{ geometry in
            NavigationView {
                ZStack{
                    Color("background").ignoresSafeArea()
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            TopBarView()
                            SloganView().padding()
                            SearchView(search: $search)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack{
                                    ForEach(0..<categories.count){ i in
                                        Button(action: {
                                            selectedIndex = i
                                        }, label: {
                                           CategoriesView(isActive: selectedIndex == i, text: categories[i])
                                        })
                                    }
                                }
                                .padding()
                            }
                            Text("Trending")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 0){
                                    ForEach(0..<4) { i in
                                      ProductView(image: Image("sh\(i+1)"), size: 130)
                                    }
                                    .padding(.leading)
                                }
                            }
                            .padding(.bottom)
                            
                            Text("Popular")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            ScrollView{
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 20) {
                                    ForEach(0..<4){i in
                                        ProductView(image: Image("sh\(i+1)"), size: geometry.size.width / 2 - 60)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }.padding(.bottom, 70)
                    }
                    
                }
            }.navigationBarHidden(true)
//            .padding(.bottom, 70)
            VStack{
                Spacer()
                BottomNavigationBarView()
            }
        }
    }
}

#Preview {
    Ecommerce()
}


struct TopBarView: View {
    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: "dot.viewfinder")
                    .padding(.all, 10)
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 20))
            })
            Spacer()
            Button(action:{}, label: {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .background(Color.white)
            })
            .cornerRadius(10.0)
        }.padding(.horizontal)
    }
}


struct SloganView: View {
    var body: some View {
        HStack{
            Text("Discover \nYour")
                .font(.system(size: 18))
                .fontWeight(.regular)
                .foregroundColor(Color("primary"))
            Text("Next Style")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(Color("primary"))
        }
    }
}

struct SearchView: View {
    @Binding var search: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .padding(.trailing, 8)
                .foregroundColor(Color("primary"))
            TextField("Search Something Stylish", text: $search)
        }
        .padding(.all, 15)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}


struct CategoriesView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading){
            Text(text)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.all, 15)
                .frame(minWidth: 90)
                .foregroundColor(isActive ? Color.white : Color("primary"))
                .background(isActive ? Color.black : Color("secondary"))
                .cornerRadius(15)
        }
        .padding(.trailing, 5)
    }
}

struct ProductView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack(spacing: 15){
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            
            VStack(spacing: 8){
                Text("Cacual Shirt")
                    .font(.title)
                    .fontWeight(.semibold)
                HStack(spacing: 2.0){
                    Text("$")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.top, 5)
                    Text("99.0")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(width: size)
        .padding(.all, 10)
        .background(Color.white)
        .cornerRadius(20)
        .cornerRadius(60, corners: [.bottomRight])
    }
}

struct BottomNavigationBarView: View {
    var body: some View {
        HStack {
            NavigationBar(image: Image(systemName: "house.fill"), action: {})
            NavigationBar(image: Image(systemName: "heart.fill"), action: {})
            NavigationBar(image: Image(systemName: "message.fill"), action: {})
            NavigationBar(image: Image(systemName: "cart.fill"), action: {})
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y:6)
    }
}
struct NavigationBar: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: {}, label: {
            image
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        })
    }
}

// For specific corner radious
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner

    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
