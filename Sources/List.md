# List
A List is a container that presents rows of data arranged in a single column.
```swift
struct ContentView: View {
    let testArray = ["C","C++","Objective C","Swift"]
    var body: some View {
        List (testArray,id: \.self) { element in
            HStack {
                Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text(element)
                    .font(.body)
            }
        }
    }
}
```
```swift
struct ContentView: View {
    let testArray = ["C","C++","Objective C","Swift"]
    var body: some View {
        List {
            ForEach(testArray, id: \.self){ element in
                Text(element)
                    .font(.body)
            }
        }
    }
}
```
## Dynamic List
```swift
struct ContentView: View {
    @State private var textList = [String]()
    var body: some View {
        NavigationView {
            List {
                ForEach(textList,id: \.self){ item in
                    RowView(text: item)
                }
            }
            .navigationTitle("Text List")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
        }.onAppear(){
            self.textList = ["C","C++","Objective C", "Objective C++","Swift"]
        }
    }
}
    
struct RowView : View {
    var text : String = ""
    var body: some View {
        Text("\(text)")
    }
}
```
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
<img src="https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/List.png" width="200" height="450">

--
```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(languages) { languages in
                    Section(header: Text(languages.title)){
                        ForEach(languages.languageType){ language in
                            NavigationLink(destination : DetailsView(chosenLanguage: language)){
                                Text(language.language)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("Languages")
                                    .font(.largeTitle))
        }
    }
}

struct DetailsView: View {
    
    var chosenLanguage : LanguageModel
    
    var body: some View {
        VStack {
            Image(chosenLanguage.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4, alignment: .center)
            Text(chosenLanguage.language)
                .font(.title)
                .foregroundColor(Color.black)
            Text(chosenLanguage.description)
                .font(.title3)
                .foregroundColor(Color.gray)
        }
    }
}

struct LanguageType : Identifiable {
    var id = UUID()
    var title : String
    var languageType : [LanguageModel]
    
}

struct LanguageModel : Identifiable {
    var id = UUID()
    var language : String
    var image : String
    var description : String
}

let rust = LanguageModel(language: "Rust", image: "rust", description: "Compiled")
let kotlin = LanguageModel(language: "Kotlin", image: "kotlin", description: "Compiled")
let swift = LanguageModel(language: "Swift", image: "swift", description: "Compiled")
let javascript = LanguageModel(language: "JavaScript", image: "javascript", description: "Interpreted")
let python = LanguageModel(language: "Python", image: "python", description: "Interpreted")
let ruby = LanguageModel(language: "Ruby", image: "ruby", description: "Interpreted")

let compiled = LanguageType(title: "Compiled", languageType: [rust,kotlin,swift])
let interpreted = LanguageType(title: "Interpreted", languageType: [javascript,python,ruby])

let languages = [compiled,interpreted]
```
