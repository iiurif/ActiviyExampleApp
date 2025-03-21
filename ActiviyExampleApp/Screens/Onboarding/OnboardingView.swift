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
            Color.brown.opacity(0.3)
                .ignoresSafeArea()
            
            Image("logo")
                .resizable()
                .frame(width: 200,height: 250)
                .scaledToFit()
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
