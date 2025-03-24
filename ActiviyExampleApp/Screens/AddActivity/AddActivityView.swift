////
////  AddActivityView.swift
////  ActiviyExampleApp
////
////  Created by User on 17/03/25.
////
//
import SwiftUI

struct AddActivityView : View {
    
    
    @EnvironmentObject var vm : ActivityViewModel
    @Environment(\.dismiss) var dismiss
    
    var activity : Activity?
    
    @State var title : String = ""
    @State var description : String = ""
    @State var notes : String = ""
    @State var startDate : Date = Date()
    @State var category : Category = .ludico
    @State var endDate : Date = Date()
    @State var isDone : Bool = false
    
    @State private var selectedCategory: Category = .ludico
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea(edges:.bottom)
                
                VStack() {
                    
                    titleComponent
                    
                    descriptionComponent
                        
                    
                    dateComponent
                    
                    categoryComponent
                        .frame(height: UIScreen.main.bounds.height * 0.12)
                        .opacity(0.8)
                        
                    
                    notesComponent
                        
                    
                    doneComponent
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                        .opacity(0.8)
                    
                    AppButton(text: "Excluir atividade", isDescructive: true) {
                    
                    }.padding()
                }
            }.toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar", role: .destructive) {
                        dismiss()
                    }.foregroundStyle(.red)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        if checkFields() {
                            let newActivity = Activity(title: self.title,
                                                       description: self.description,
                                                       notes: self.notes,
                                                       startDate: self.startDate,
                                                       endDate: self.endDate,
                                                       isDone: isDone)
                            vm.addActvitiy(newActivity)
                            dismiss()
                        }
                    } label: {
                        Text("Salvar")
                    }

                }
            }
        }
    }
    
    private var titleComponent : some View {
        Rectangle()
            .foregroundStyle(.white)
            .overlay {
                TextField("", text: $title, prompt: Text("Digite o titulo de sua atividade.")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .fontWeight(.bold))
                    .padding(.top,20)
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
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
                .foregroundStyle(.white.opacity(0.9))
                .frame(height: UIScreen.main.bounds.size.height * 0.09)
                .padding(.horizontal)
                .overlay {
                    VStack {
                        TextField("", text: $description, prompt: Text("Descreva aqui sua atividade."))
                            .offset(y:-20)
                    }.padding(.horizontal,20)
                }
        }
    }
    
    private var dateComponent : some View {
        Group {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.white.opacity(0.9))
                .frame(height: UIScreen.main.bounds.size.height * 0.12)
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
    
    private var notesComponent : some View {
        Group {
            HStack {
                Text("NOTAS:")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal,20)
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white.opacity(0.9))
                .frame(height: UIScreen.main.bounds.size.height * 0.1)
                .padding(.horizontal)
                .overlay {
                    VStack {
                        TextField("", text: $description, prompt: Text("Digite aqui as notas da sua atividade"))
                            .offset(y:-20)
                    }.padding(.horizontal,20)
                }
        }
    }
    
    private var doneComponent : some View {
        List {
            Picker(selection: $selectedCategory) {
                ForEach(Done.allCases) { done in
                    Text(done.description)
                        .tag(done.self)
                }
            } label: {
                Text("Atividade concluída:")
            }
        }.scrollContentBackground(.hidden)
    }
    
    private func checkFields() -> Bool {
        return (title != "" && !title.isEmpty )
    }
}

#Preview {
    AddActivityView()
        .environmentObject(ActivityViewModel())
}
