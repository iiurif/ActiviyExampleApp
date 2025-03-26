import SwiftUI

struct MenuPage: View {
    
    @Binding var screen: ScreenState
    @State private var navigateToHome = false // State to trigger navigation
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    ZStack{
                        Image("MenuCat")
                        Text("Olá Fulano! Como Irá aproveitar seu tempo livre hoje?")
                    }.padding(.bottom, 15)
                    
                    // NavigationLink wrapped around AppButton
                    NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                        AppButton(text: "Aceitar Sugestão Aleatória") {
                            // Trigger the navigation
                            
                        }
                    }
                    .padding(.bottom, 5)
                    
                    // Another button without navigation
                    AppButton(text: "Acessar Atividades") {
                        // Your other action here
                        navigateToHome = true
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    MenuPage(screen: .constant(.three))
}
