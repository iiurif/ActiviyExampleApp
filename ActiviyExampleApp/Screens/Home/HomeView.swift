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
            Color.appBackground
                .ignoresSafeArea(.all, edges: .bottom)
            
                VStack {
                    categoryMenu
                        .padding(.top,5)
                    
                    activityListView
                        .opacity(activities.isEmpty ? 0.0 : 1.0)
                    
                }
                .searchable(text: $searchActivity, prompt: "Pesquise aqui sua atividade")
            
            .navigationTitle("Atividades")
            .navigationBarTitleDisplayMode(.automatic)
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
                            .foregroundStyle(selectedCategory == category ? .white : .black)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .frame(height: 35)
                            .background(selectedCategory == category ? .black : Color.brown.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
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
                        .foregroundStyle(Color.brown)
                        .overlay {
                            Text(activity.title)
                                .foregroundStyle(.white)
                        }
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            Section("Atividades Concluídas") {
                ForEach(filteredActivities.filter { $0.isDone }) { activity in
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.brown)
                        .overlay {
                            Text(activity.title)
                                .foregroundStyle(.white)
                        }
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
    }
    private var emptyActivity: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(height: UIScreen.main.bounds.size.height * 0.2)
            .foregroundStyle(.background.opacity(0.6))
            .padding(.horizontal,50)
            .overlay {
                VStack {
                    Text(selectedCategory.emptyDescription)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal,55)
                }
            }
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
