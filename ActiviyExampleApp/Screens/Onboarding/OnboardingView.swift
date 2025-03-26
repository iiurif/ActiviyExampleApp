//  Created by User on 18/03/25.


/*
 
 Primeira página do aplicativo)
 Essa pagina contem a apresentação do aplicativo e ja direciona ele para o fluxo de telas do arquivo
 OnboardingFlow.
 
 */

import SwiftUI

struct OnboardingView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Color.fundoDefault
                .ignoresSafeArea()
            if isActive {
                OnboardingFlow()
                    .transition(.move(edge: .top))
            } else {
                Image("AppLogo")
                    .resizable()
                    .frame(width: 200,height: 250)
                    .scaledToFit()
            }
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    isActive.toggle()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
