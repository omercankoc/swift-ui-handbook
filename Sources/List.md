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
```swift
struct ContentView: View {
    
    @State private var textList = [String]()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(textList,id: \.self){ item in
                    NavigationLink( destination: DetailView(message: item)){
                        RowView(text: item)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Text List")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
                
        }
        .onAppear(){
            self.textList = ["C","C++","Objective C", "Objective C++","Swift"]
        }
    }
    
    func deleteItem(at offsets : IndexSet){
        self.textList.remove(atOffsets: offsets)
    }
}

struct DetailView : View {
    var message : String
    var body: some View {
        HStack {
            Text(message)
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
