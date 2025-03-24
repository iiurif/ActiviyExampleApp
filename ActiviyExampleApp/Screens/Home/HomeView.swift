//
//  HomeView.swift
//  ActiviyExampleApp
//
//  Created by User on 17/03/25.
//

import SwiftUI

struct HomeView : View {
    
    
    @EnvironmentObject var activityViewModel : ActivityViewModel
    
    @State var selectedCategory : Category = .ludico
    @State var addActivityView : Bool = false
    @State var activities : [Activity] = []
    @State var searchActivity: String = ""
    
    @State var showAddActivitySheet : Bool = false
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea(.all, edges: .bottom)
            NavigationStack {
                VStack {
                    categoryMenu
                        .padding(.top,5)
                    
                    activityListView
                        .opacity(activityViewModel.activities.isEmpty ? 0.0 : 1.0)
                    
                }
                .searchable(text: $searchActivity, prompt: "Pesquise aqui sua atividade")
            }
            .navigationTitle("Atividades")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.body)
                        Text("Voltar")
                            .font(.body)
                            .fontWeight(.bold)
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showAddActivitySheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(Color.black)
                            .padding(.top,40)
                    }
                }
            }
            .sheet(isPresented: $showAddActivitySheet) {
                AddActivityView()
            }
            if activityViewModel.activities.isEmpty {
                emptyActivity
            }
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
    
    private var activityListView : some View {
        VStack {
            List {
                Section("") {
                    ForEach(activityViewModel.activities) { activity in
                        if !activity.isDone {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(Color.brown)
                                .overlay {
                                    Text(activity.title)
                                }
                        }
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                Section("Atividades Concluídas") {
                    ForEach(activityViewModel.activities) { activity in
                        if activity.isDone {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.brown)
                                .overlay {
                                    Text(activity.title)
                                }
                        }
                    }
                }
            }.scrollContentBackground(.hidden)
        }
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

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(ActivityViewModel())
    }
}

