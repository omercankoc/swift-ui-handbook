# Sheet
Presents a sheet when a binding to a Boolean value that you provide is true.

```swift
struct ContentView: View {
    @State private var sheet : Bool = false
    @State var message : String = ""
        
    var body: some View {
        
        VStack {
            TextField("Enter Message",text: $message)
                .padding(.leading,10)
                .frame(width: 300, height: 40, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black)
                }
            
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
    var message : String?   
    @Environment(\.presentationMode) var detailView
 
    var body: some View {
        VStack{
            Text("\(message!)")
            
            Button {
                self.detailView.wrappedValue.dismiss()
            } label: {
                Text("Wrapped Value Dismiss")
            }
        }
    }
}
```

# Full Screen Cover
Presents a modal view that covers as much of the screen as possible when binding to a Boolean value you provide is true.

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
    var message : String?
    @Environment(\.presentationMode) var detailView
    
    var body: some View {
        VStack{
            Text("\(message!)")
            
            Button {
                self.detailView.wrappedValue.dismiss()
            } label: {
                Text("Wrapped Value Dismiss")
            }
        }
    }
}
```

# Popover
Presents a popover when a given condition is true.

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
    var message : String?
    @Environment(\.presentationMode) var detailView
   
    var body: some View {
        VStack{
            Text("\(message!)")
            
            Button {
                self.detailView.wrappedValue.dismiss()
            } label: {
                Text("Wrapped Value Dismiss")
            }
        }
    }
}
```

# Navigation Stack
A view that displays a root view and enables you to present additional views over the root view.

```swift
struct Person : Hashable {
    var name: String?
    var surname: String?
    var email: String?
    var phone: String?
}

struct ContentView: View {
    @State var person : Person = Person()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                NavigationLink(value: person) {
                    Text("Show Detail to \(person.name ?? "Guest")")
                }
            }
            .navigationTitle("Content View")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Person.self) { person in
                DetailView(person: person)
            }
            .task {
                person = Person(name: "Chris", 
                                surname: "Lattner",
                                email: "chrislattner@mail.com",
                                phone: "+1234567890")
            }
        }
    }
}

struct DetailView : View {
    var person = Person()
    
    var body: some View {
        VStack{
            Text("Hello \(person.name ?? "") \(person.surname ?? "")! ")
            Text("To Contact Me \(person.email ?? "") or \(person.phone ?? "")")
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
```

# Toolbar
Populates the toolbar or navigation bar with the specified items.

```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
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
A view that switches between multiple child views using interactive user interface elements.

```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    Text("First Screen")
                        .font(.largeTitle)
                }
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(0)
                
                VStack {
                    Text("Second Screen")
                        .font(.largeTitle)
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
