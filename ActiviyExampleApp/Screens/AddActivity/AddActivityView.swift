////
////  AddActivityView.swift
////  ActiviyExampleApp
////
////  Created by User on 17/03/25.
////
//
import SwiftUI

struct AddActivityView : View {
    
    @State var description : String = ""
    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    
    enum Category: String, CaseIterable, Identifiable {
        case ludico, esportivos, criativos, outros
        var id: Self { self }
        
        var description : String {
            switch self {
            case .ludico:
                return "Lúdico"
            case .esportivos:
                return "Esportivos"
            case .criativos:
                return "Crativos"
            case .outros:
                return "Outros"
            }
        }
    }
    
    @State private var selectedCategory: Category = .ludico
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.3)
                .ignoresSafeArea()
            VStack() {
                descriptionComponent
                
                dateComponent
                    .padding(.top,15)
                
                categoryComponent
                    .offset(y:-15)
                
            }
        }
    }
    
    private var descriptionComponent : some View {
        Group {
            HStack {
                Text("DESCRIÇÃO:")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal,20)
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white.opacity(0.4))
                .frame(height: UIScreen.main.bounds.size.height * 0.15)
                .padding(.horizontal)
                .overlay {
                    VStack {
                        TextField("", text: $description, prompt: Text("Descrição da atividade"))
                            .offset(y:-20)
                    }.padding(.horizontal,20)
                }
        }
    }
    
    private var dateComponent : some View {
        Group {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.white.opacity(0.5))
                .frame(height: UIScreen.main.bounds.size.height * 0.15)
                .padding(.horizontal)
                .overlay {
                    VStack {
                        DatePicker("Inicio", selection: $startDate)
                        Divider()
                        DatePicker("Termino", selection: $endDate)
                    }.padding(.horizontal,30)
                }
        }
    }
    
    private var categoryComponent : some View {
        List {
            Picker(selection: $selectedCategory) {
                ForEach(Category.allCases) { category in
                    Text(category.description)
                        .tag(category.self)
                }
            } label: {
                Text("Categoria:")
            }
        }.scrollContentBackground(.hidden)
    }
}

#Preview {
    AddActivityView()
}
