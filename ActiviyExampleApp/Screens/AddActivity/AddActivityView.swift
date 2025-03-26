import SwiftUI
import SwiftData

struct AddActivityView: View {
    
    @Environment(\.modelContext) private var modelContext  // ✅ Use SwiftData directly
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var notes: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var isDone: Bool = false
    @State private var selectedCategory: Category = .ludico  // ✅ Use Category directly

    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground.ignoresSafeArea(edges: .bottom)

                VStack {
                    titleComponent
                    ScrollView {
                        descriptionComponent
                        dateComponent
                        categoryComponent
                            .frame(height: UIScreen.main.bounds.height * 0.12)
                            .offset(y: -20)
                            .opacity(0.8)
                        notesComponent
                        doneComponent
                            .frame(height: UIScreen.main.bounds.height * 0.12)
                            .offset(y: -20)
                            .opacity(0.8)
                    }
                }
            }
            .onTapGesture {
                self.endTextEditing()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar", role: .destructive) {
                        dismiss()
                    }.foregroundStyle(.red)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        saveActivity()  // ✅ Insert into SwiftData
                    } label: {
                        Text("Salvar")
                    }
                }
            }
        }
    }

    private func saveActivity() {
        guard checkFields() else { return }

        let newActivity = Activity(
            title: title,
            description: description,
            notes: notes,
            startDate: startDate,
            endDate: endDate,
            isDone: isDone, category: self.selectedCategory
        )
        modelContext.insert(newActivity)  // ✅ Insert directly into SwiftData
        dismiss()
    }

    private var titleComponent: some View {
        Rectangle()
            .frame(height: UIScreen.main.bounds.size.height * 0.15)
            .foregroundStyle(.white)
            .overlay {
                TextField("Digite o título de sua atividade.", text: $title)
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
            }
    }

    private var descriptionComponent: some View {
        VStack(alignment: .leading) {
            Text("DESCRIÇÃO:")
                .fontWeight(.bold)
                .padding(.horizontal, 20)

            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white.opacity(0.9))
                .frame(height: UIScreen.main.bounds.size.height * 0.09)
                .padding(.horizontal)
                .overlay {
                    TextField("Descreva aqui sua atividade.", text: $description)
                        .padding(.horizontal, 20)
                }
        }
    }

    private var dateComponent: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color.white.opacity(0.9))
            .frame(height: UIScreen.main.bounds.size.height * 0.12)
            .padding(.horizontal)
            .overlay {
                VStack {
                    DatePicker("Início", selection: $startDate)
                    Divider()
                    DatePicker("Término", selection: $endDate)
                }
                .padding(.horizontal, 30)
            }
    }

    private var categoryComponent: some View {
        Picker("Categoria:", selection: $selectedCategory) {
            ForEach(Category.allCases) { category in
                Text(category.description).tag(category)  // ✅ Fix Picker issue
            }
        }
        .pickerStyle(.menu)
        .padding()
    }

    private var notesComponent: some View {
        VStack(alignment: .leading) {
            Text("NOTAS:")
                .fontWeight(.bold)
                .padding(.horizontal, 20)

            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white.opacity(0.9))
                .frame(height: UIScreen.main.bounds.size.height * 0.1)
                .padding(.horizontal)
                .overlay {
                    TextField("Digite aqui as notas da sua atividade", text: $notes)
                        .padding(.horizontal, 20)
                }
        }
    }

    private var doneComponent: some View {
        Toggle("Atividade Concluída:", isOn: $isDone)
            .padding()
    }

    private func checkFields() -> Bool {
        return !title.isEmpty
    }
}

#Preview {
    do {
        let modelContainer = try ModelContainer(
            for: Activity.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        return NavigationStack {
            AddActivityView()
                .modelContainer(modelContainer)  // ✅ Use ModelContainer directly
        }
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
