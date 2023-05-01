# Sheet
```swift
struct ContentView: View {
    
    @State private var sheet : Bool = false
    @State var message : String = ""
        
    var body: some View {
        
        VStack {
            TextField("Enter Message",text: $message)
                .padding(.leading,10)
                .frame(width: 300, height: 40, alignment: .center)
                .background { RoundedRectangle(cornerRadius: 10).stroke(.black) }
            
            Button {
                self.sheet.toggle()
            } label: {
                Text("Show Sheet")
            }.sheet(isPresented: $sheet) {
                DetailView(message: message)
            }
        }
    }
}

struct DetailView : View {
    
    @Environment(\.presentationMode) var toContentView
    
    var message : String?
    
    var body: some View {
        VStack{
            Text("\(message!)")
            
            Button {
                self.toContentView.wrappedValue.dismiss()
            } label: {
                Text("Wrapped Value Dismiss")
            }
        }
    }
}
```

# Full Screen Cover
```swift
struct ContentView: View {
    
    @State private var cover : Bool = false
    @State private var message : String = ""
        
    var body: some View {
        
        VStack {
            TextField("Enter Message",text: $message)
                .padding(.leading,10)
                .frame(width: 300, height: 40, alignment: .center)
                .background { RoundedRectangle(cornerRadius: 10).stroke(.black) }
            
            Button {
                self.cover.toggle()
            } label: {
                Text("Show Full Screen Cover")
            }.fullScreenCover(isPresented: $cover) {
                DetailView(message: message)
            }
        }
    }
}

struct DetailView : View {
    
    @Environment(\.presentationMode) var toContentView
    
    var message : String?
    
    var body: some View {
        VStack{
            Text("\(message!)")
            
            Button {
                self.toContentView.wrappedValue.dismiss()
            } label: {
                Text("Wrapped Value Dismiss")
            }
        }
    }
}
```

# Popover
```swift
struct ContentView: View {
    
    @State private var popover : Bool = false
    @State var message : String = ""
        
    var body: some View {
        
        VStack {
            TextField("Enter Message",text: $message)
                .padding(.leading,10)
                .frame(width: 300, height: 40, alignment: .center)
                .background { RoundedRectangle(cornerRadius: 10).stroke(.black) }
            
            Button {
                self.popover.toggle()
            } label: {
                Text("Show Popover")
            }.popover(isPresented: $popover) {
                DetailView(message: message)
            }
        }
    }
}

struct DetailView : View {
    
    @Environment(\.presentationMode) var toContentView
    
    var message : String?
    
    var body: some View {
        VStack{
            Text("\(message!)")
            
            Button {
                self.toContentView.wrappedValue.dismiss()
            } label: {
                Text("Wrapped Value Dismiss")
            }
        }
    }
}
```

# Navigation Stack
```swift
struct Person : Hashable {
    var name : String?
    var surname : String?
}

struct ContentView: View {
    
    @State var person : Person = Person(name: "Chris", surname: "Lattner")
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(value: person) {
                    Text("Show Navigation")
                }
            }
            .navigationTitle("Content View")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Person.self) { person in
                DetailView(person: person)
            }
        }
    }
}

struct DetailView : View {
        
    var person = Person()
    
    var body: some View {
        VStack{
            Text("Hello \(person.name ?? "") \(person.surname ?? "")! ")
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
```

# Toolbar
```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Content View")
            }
            .navigationTitle("Content View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("HELP")
                    } label: {
                        Text("Help")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("FOLDER")
                    } label: {
                        Image(systemName: "folder")
                    }
                    Button {
                        print("TRASH")
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
}
```

# Tab View
```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    Text("First Screen").font(.largeTitle)
                }
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(0)
                
                VStack {
                    Text("Second Screen").font(.largeTitle)
                }
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(1)
            }
            .navigationTitle("Content View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("Navigation Bar")
                    } label: {
                        Image(systemName: "3.circle")
                    }
                }
            }
        }
    }
}
```
