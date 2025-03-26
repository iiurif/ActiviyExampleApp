//  HomeView.swift
//  ActiviyExampleApp
//
//  Created by User on 17/03/25.
//

import SwiftUI
import SwiftData

struct HomeView : View {
    
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var selectedCategory: Category = .ludico
    @State private var searchActivity: String = ""
    @State private var showAddActivitySheet: Bool = false
    
    @Query private var activities: [Activity]
    
    private var filteredActivities: [Activity] {
        activities
            .filter { $0.category == selectedCategory }
            .filter { searchActivity.isEmpty || $0.title.localizedCaseInsensitiveContains(searchActivity) }
    }
    
    var body: some View {
        ZStack {
            Color.ballons
                .ignoresSafeArea(.all, edges: .bottom)
            
                VStack {
                    categoryMenu
                        .padding(.top,5)
                    
                    if !filteredActivities.isEmpty {
                        activityListView
                            .opacity(activities.isEmpty ? 0.0 : 1.0)
                    } else {
                        Spacer()
                        emptyActivity
                        Spacer()
    
                    }
                    
                    
                }
                .searchable(text: $searchActivity, prompt: "Pesquise aqui sua atividade")
            
            .navigationTitle("Atividades")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {

                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showAddActivitySheet.toggle()
                    } label: {
                       Text("Adicionar")
                    }
                }
            }
            .sheet(isPresented: $showAddActivitySheet) {
                AddActivityView()
            }
            if activities.isEmpty {
                emptyActivity
            }
        }.onTapGesture {
            self.endTextEditing()
        }
    }
    
    private var categoryMenu : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category.description)
                            .foregroundStyle(selectedCategory == category ? Color.white : Color.accent)
                            .padding(.horizontal)
                            .frame(height: 52)
                            .background(selectedCategory == category ? Color.accent : Color.piker)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }.padding()
        }
    }
    
    private var activityListView: some View {
        List {
            Section("Atividades Pendentes") {
                ForEach(filteredActivities.filter { !$0.isDone }) { activity in
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 359, height: 67)
                        .foregroundStyle(Color.cards)
                        .shadow(radius: 5, x: 0, y: 2)
                        .overlay {
                            Text(activity.title)
                                .foregroundStyle(Color.accentColor)
                        }
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            Section("Atividades Concluídas") {
                ForEach(filteredActivities.filter { $0.isDone }) { activity in
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 359, height: 67)
                        .foregroundStyle(.gray)
                        .shadow(radius: 5, x: 0, y: 3)
                        .overlay {
                            Text(activity.title)
                                .foregroundStyle(Color.white)
                        }
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
    }
    private var emptyActivity: some View {
        VStack {
            if selectedCategory == .ludico{
                Image("0ludico")
                    .padding(10)
            }
            if selectedCategory == .criativos{
                Image("0criativo")
                    .padding(10)
            }
            if selectedCategory == .esportivos{
                Image("0esportivo")
                    .padding(10)
            }
            if selectedCategory == .outros{
                Image("0outros")
                    .padding(10)
            }
        }//VStack
    }
    
}

//#Preview {
//    do {
//        let modelContainer = try ModelContainer(
//            for: Activity.self,
//            configurations: ModelConfiguration(isStoredInMemoryOnly: true) // In-memory store
//        )
//        let modelContext = modelContainer.mainContext
//        let viewModel = ActivityViewModel(modelContext: modelContext)
//
//        NavigationStack {
//            HomeView()
//                .environmentObject(viewModel)
//        }
//    } catch {
//        Text("Failed to create preview: \(error.localizedDescription)")
//    }
//}
