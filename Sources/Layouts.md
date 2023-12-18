## HStack
A view that arranges its subviews in a horizontal line.
```swift
struct ContentView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("SwiftUI")
                .foregroundColor(Color.blue)
            Text("UIKit")
                .foregroundColor(Color.green)
        }
    }
}
```

## VStack
A view that arranges its subviews in a vertical line.
```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Swift")
                .foregroundColor(Color.blue)
            Text("Objective-C")
                .foregroundColor(Color.green)
        }
    }
}
```

### Horizontal Stack and Vertical Stack in Alignment and Spacing
Modify the alignment and spacing between elements.
```swift
struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("First")
            Text("Second")
            Text("Third")
        }
    }
}
```
```swift
struct ContentView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10){
            Text("First")
            Text("Second")
            Text("Third")
        }
    }
}
```

## ZStack
A view that overlays its subviews, aligning them in both axes.
```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Hello")
                .foregroundColor(Color.blue)
            Text("World")
                .foregroundColor(Color.green)
        }
    }
}
```

## Grid
A container view that arranges other views in a two dimensional layout.
```swift
struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Red")
                ForEach(0..<4) { _ in Color.red }
            }
            GridRow {
                Text("Green")
                ForEach(0..<2) { _ in Color.green }
            }
            GridRow {
                Text("Blue")
                ForEach(0..<3) { _ in Color.blue }
            }
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
}
```

## Spacer
A flexible space that expands along the major axis of its containing stack layout, or on both axes if not contained in a stack.
```swift
struct ContentView: View {
    var body: some View {
        Text("First")
        Spacer()
        Text("Second")    }
}
```
```swift
struct ContentView: View {
    var body: some View {
        VStack{
             Text("First")
             Spacer().frame(height: 10)
             Text("Second")
        }
    }
}
```
```swift
struct ContentView: View {
    var body: some View {
        HStack{
             Text("First")
             Spacer().frame(width: 10)
             Text("Second")
        }
    }
}
```

## Padding
Adds an equal padding amount to specific edges of this view.
```swift
struct ContentView: View {
    var body: some View {
        HStack{
            Text("First").padding(.top,10)
            Text("Second").padding(.bottom,10)
            Text("Third").padding(.leading,10)
            Text("Fourth").padding(.trailing,10)
            Text("Fifth").padding(.all,5)
            Text("Sixth").padding()
        }
    }
}
```

## Frame
The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
```swift
struct ContentView: View {
    var body: some View {
        Text("SwiftUI and Swift")
            .frame(width: 300, height: 50, alignment: .center)
    }
}
```

## GeometryReader 
A container view that defines its content as a function of its own size and coordinate space.
```swift
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Swift")
                Text("Objective C")
                Text("C++")
                Text("C")
            }
            .frame(width: geometry.size.width, height: geometry.size.height,  alignment: .center)
        }
    }
}
```

## ScrollView
A scrollable view.
```swift
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                ForEach(0...25, id: \.self){ iterator in
                    Text("ITEM : \(iterator)")
                        .font(.body)
                        .frame(width: geometry.size.width, height: geometry.size.height / 5, alignment: .center)
                        .background(Color.green)
                }
            }
        }
    }
}
```

### Scroll View Reader
A view that provides programmatic scrolling, by working with a proxy to scroll to known child views.
```swift
struct ContentView: View {
    
    @Namespace var topID
    @Namespace var bottomID
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll to Bottom") {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }
                .id(topID)

                VStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        color(fraction: Double(i) / 100)
                            .frame(height: 32)
                    }
                }

                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(topID)
                    }
                }
                .id(bottomID)
            }
        }
    }

    func color(fraction: Double) -> Color {
        Color(red: fraction, green: 1 - fraction, blue: 0.5)
    }
}
```

## LazyHStack
A view that arranges its children in a line that grows horizontally, creating items only as needed.
```swift
struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .center, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("\($0)")
                        .frame(width: 50, height: 50, alignment: .center)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .stroke(Color.red)
                        }
                }
            }
        }
    }
}
```

## LazyVStack
A view that arranges its children in a line that grows vertically, creating items only as needed.
```swift
struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .center, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("\($0)")
                        .frame(width: 50, height: 50, alignment: .center)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .stroke(Color.red)
                        }
                }
            }
        }
    }
}
```

## LazyHGrid
A container view that arranges its child views in a grid that grows horizontally, creating items only as needed.
```swift
struct ContentView: View {
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                    Text(emoji(value))
                        .font(.largeTitle)
                }
            }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}
```

## LazyVGrid
A container view that arranges its child views in a grid that grows vertically, creating items only as needed.
```swift
struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                    Text(emoji(value))
                        .font(.largeTitle)
                }
            }
        }
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}
```

## List
A container that presents rows of data arranged in a single column, optionally providing the ability to select one or more members.

```swift
struct ContentView: View {
    @State private var languages: [String] = []
    @State private var searchable: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.languages, id: \.self){ language in
                    NavigationLink(value: language){
                        RowView(language: language)
                    }
                }
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
            self.languages = self.fetch()
        }
        .onChange(of: searchable) { oldValue, newValue in
            self.languages = search(newValue)
        }
    }
        
    func search(_ searchable : String) -> [String] {
        if searchable == "" {
            return self.fetch()
        } else {
            return self.fetch().filter(
                {
                    $0.lowercased().hasPrefix(searchable.lowercased())
                }
            )
        }
    }
    
    func fetch() -> [String]{
        return ["C","C++","Objective-C","Java","C#","Swift","Kotlin","Rust","Go","Python","Ruby","Perl","PHP","JavaScript","Scala","Basic","Assembly","Fortran","Dart"]
    }
}

struct RowView : View {
    var language : String?
    
    var body: some View {
        Text(language ?? "Not Found")
    }
}

struct DetailView : View {
    var language : String?
    
    var body: some View {
        HStack {
            Text(language ?? "Not Found")
        }
    }
}
```

## Section
A container view that you can use to add hierarchy within certain views.

```swift
struct Procedure : Identifiable, Hashable {
    var id = UUID()
    var procedure : String
    var languages : [Language]
}

struct Language : Identifiable, Hashable {
    var id = UUID()
    var language : String
}

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
            self.sections = fetch()
        }
    }
    
    private func fetch() -> [Procedure] {
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
```

