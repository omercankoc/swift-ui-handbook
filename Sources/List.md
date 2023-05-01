# List
```swift
struct ContentView: View {
    
    @State private var languages_ : [String] = []
    @State private var language : [String] = []
    @State private var searchable : String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(languages_, id: \.self){ language in
                    NavigationLink(value: language){
                        RowView(language: language)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .listStyle(.inset)
            .navigationTitle("Languages")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: String.self) { language in
                DetailView(language: language)
            }
        }
        .searchable(text: $searchable)
        .onAppear {
            self.language = ["C","C++","Objective-C","Java","C#","Swift","Kotlin","Rust","Go","Python","Ruby","Perl","PHP","JavaScript","Scala","Basic","Assembly","Fortran","Dart"]
            self.languages_ = self.language
        }
        .onChange(of: searchable) { search in
            self.languages_ = searchItem(search)
        }
    }
    
    func deleteItem(at offsets : IndexSet){
        self.languages_.remove(atOffsets: offsets)
    }
        
    func searchItem(_ searchable : String) -> [String] {
        if searchable == "" {
            return self.language
        } else {
            return self.languages_.filter(
                {
                    $0.lowercased().hasPrefix(searchable.lowercased())
                }
            )
        }
    }
}

struct DetailView : View {
    var language : String
    
    var body: some View {
        HStack {
            Text(language)
        }
    }
}
    
struct RowView : View {
    var language : String = ""
    
    var body: some View {
        Text("\(language)")
    }
}
```

# Section
```swift
struct ContentView: View {
    
    @State var sections : [Procedure] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.sections) { languages in
                    Section(header: Text(languages.procedure)){
                        ForEach(languages.languages){ language in
                            NavigationLink(value: language) {
                                Text(language.language)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Languages")
            .navigationDestination(for: Language.self) { language in
                DetailsView(language: language)
            }
        }
        .onAppear {
            self.sections = get()
        }
    }
    
    private func get() -> [Procedure] {
        let c = Language(language: "C")
        let cplusplus = Language(language: "C++")
        let java = Language(language: "Java")
        let csharp = Language(language: "C#")
        let python = Language(language: "Python")
        let ruby = Language(language: "Ruby")
        let javascript = Language(language: "JavaScript")
        let perl = Language(language: "Perl")
        let swift = Language(language: "Swift")
        let kotlin = Language(language: "Kotlin")
        let go = Language(language: "Go")
        let rust = Language(language: "Rust")
        let php = Language(language: "PHP")
        
        let compiled = Procedure(procedure: "Compiled", languages: [c,cplusplus,java,csharp,swift,kotlin,go,rust])
        let interpreted = Procedure(procedure: "Interpreted", languages: [python,ruby,perl,javascript,php])
        
        return [compiled, interpreted]
    }
}

struct DetailsView: View {
    
    var language : Language
    
    var body: some View {
        VStack {
            Text(language.language)
                .font(.title)
                .foregroundColor(Color.black)
        }
    }
}

struct Procedure : Identifiable, Hashable {
    var id = UUID()
    var procedure : String
    var languages : [Language]
}

struct Language : Identifiable, Hashable {
    var id = UUID()
    var language : String
}
```
