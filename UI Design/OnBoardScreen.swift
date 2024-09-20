import SwiftUI

//Home screen
struct Home: View {
    
    var body: some View {
        Text("Welcome to home")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.heavy)
        Text("May Allay bless you")
            .font(.body)
            .fontWeight(.medium)
    }
}

var totalPage = 3
//On board screen
struct OnBoardScreen: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        ZStack{
            if currentPage == 1 {
                ScreenView(currentPage: currentPage, image: "food", title: "Order Food", details: "")
            }
            if currentPage == 2 {
                ScreenView(currentPage: currentPage, image: "payment", title: "Easy Payment", details: "")
            }
            if currentPage == 3 {
                ScreenView(currentPage: currentPage, image: "delivery", title: "Fast Delivery", details: "")
            }

        }
    }
}

struct ScreenView: View {
    @AppStorage("currentPage") var currentPage = 1
    var image: String
    var title: String
    var details: String
    //@State var currentPage: Int
    var body: some View {
        VStack{
            HStack{
                if currentPage == 1 {
                    Text("Hello Foodies!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                Spacer()
                Button(action: {
                    currentPage = 4
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }.padding()
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 16)
                .frame(height: 300)
            
            Spacer(minLength: 80)
            Text(title)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom, 5)
                .foregroundColor(Color("mainColor"))
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            HStack{
                if currentPage == 1  {
                    Color("mainColor")
                        .frame(height: 8/UIScreen.main.scale)
                    Color.gray
                        .frame(height: 8/UIScreen.main.scale)
                    Color.gray
                        .frame(height: 8/UIScreen.main.scale)
                }
                if currentPage == 2  {
                    Color.gray
                        .frame(height: 8/UIScreen.main.scale)
                    Color("mainColor")
                        .frame(height: 8/UIScreen.main.scale)
                    Color.gray
                        .frame(height: 8/UIScreen.main.scale)
                }
                if currentPage == 3  {
                    Color.gray
                        .frame(height: 8/UIScreen.main.scale)
                    Color.gray
                        .frame(height: 8/UIScreen.main.scale)
                    Color("mainColor")
                        .frame(height: 8/UIScreen.main.scale)
                }
                
                
            }.padding([.leading, .trailing], 16)
            
            Button(action: {
                if currentPage <= totalPage {
                    currentPage += 1
                    @AppStorage("currentPage") var currentPage = currentPage
                } else {
                    currentPage = 1
                }
            }, label: {
                Text("Next")
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("mainColor"))
                    .cornerRadius(40)
                    .padding(.horizontal, 16)
            })
        }
    }
}
