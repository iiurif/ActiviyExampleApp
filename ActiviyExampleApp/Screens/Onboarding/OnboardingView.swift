//  Created by User on 18/03/25.


/*
 
 Primeira página do aplicativo)
 Essa pagina contem a apresentação do aplicativo e ja direciona ele para o fluxo de telas do arquivo
 OnboardingFlow.
 
 */

import SwiftUI

struct OnboardingView: View {
    
    @State var splash: Bool = false
    
    var body: some View {
        ZStack {
            Color.fundoDefault
                .ignoresSafeArea()
            
            Image("AppLogo")
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                splash.toggle()
            }
        }.fullScreenCover(isPresented: $splash) {
            OnboardingFlow(screen: .zero)
        }
    }
}

#Preview {
    OnboardingView()
}
