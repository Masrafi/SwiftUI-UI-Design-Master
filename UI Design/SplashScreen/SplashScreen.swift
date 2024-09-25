import SwiftUI

struct SplashScreen: View{
    @State var isActive: Bool = false
    @State var showImg: Bool = false
    @State var showText: Bool = false
    @State var showText2: Bool = false
    
        var body: some View {
            ZStack {
                Color("primary").edgesIgnoringSafeArea(.all)
                if self.isActive {
                    OnBoardScreen()
                } else {
                    VStack{
                        Image(systemName: "globe.europe.africa.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                            .opacity(showImg ? 1 : 0) // imp animation
                        
                        Text("Masrafi")
                            .font(.system(size: 30))
                            .foregroundStyle(.white.gradient)
                            .opacity(showText ? 1 : 0) // imp animation
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                            .font(.system(size: 20))
                            .foregroundStyle(.white.gradient)
                            .padding(.horizontal)
                            .opacity(showText2 ? 1 : 0) // imp animation
                    }
                }
            }
            .onAppear {
                withAnimation(.smooth(duration:1).delay(0.5)) {
                    showImg.toggle()
                }// imp animation
                withAnimation(.smooth(duration:1.5).delay(1)) {
                    showText.toggle()
                }// imp animation
                withAnimation(.smooth(duration:2).delay(2)) {
                    showText2.toggle()
                }  // imp animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}
