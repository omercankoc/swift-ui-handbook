# Sheets

SwiftUI’s sheets are used to present new views over existing ones, while still allowing users to drag down to dismiss the new view when they are ready.

To use a sheet, give it something to show (some text, an image, a custom view, etc), add a Boolean that defines whether the detail view should be showing, then attach it to your main view as a modal sheet.

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

SwiftUI’s fullScreenCover() modifier gives us a presentation style for times when you want to cover as much of the screen as possible, and in code it works almost identically to regular sheets.

Regular sheets can be dismissed by dragging downwards on them, but that isn’t possible with views presented using fullScreenCover(). As a result, it’s important you provide a way to dismiss the presented view, probably using the dismiss environment key.

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

SwiftUI has a dedicated modifier for showing popovers, which on iPadOS appear as floating balloons and on iOS slide onto the screen like a sheet.

To show a popover you need some state that determines whether the popover is currently visible, but that’s about it – unlike alerts and action sheets, popovers can contain any kind of view you want. So, just place whatever you need inside the popover and SwiftUI will take care of the rest.

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

NavigationView is one of the most important components of a SwiftUI app, allowing us to push and pop screens with ease, presenting information in a clear, hierarchical way for users.

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

If we ask for it, iOS allows us to place content anywhere on the screen, including under the system clock at the top and the home indicator at the bottom. This doesn’t look great, which is why by default SwiftUI ensures components are placed in an area where they can’t be covered up by system UI or device rounded corners – an area known as the safe area.

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

# Tab Bar

When you want to show two separate views with SwiftUI, the easiest and most user-intuitive approach is with a tab bar across the bottom of our app. In our case, that means we’ll put our menu view in one tab and the active order in another. SwiftUI gives us a TabView for just this purpose, and it works much like a UITabBarController.

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
