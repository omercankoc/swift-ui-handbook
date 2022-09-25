# Sheets
SwiftUI’s sheets are used to present new views over existing ones, while still allowing users to drag down to dismiss the new view when they are ready.

To use a sheet, give it something to show (some text, an image, a custom view, etc), add a Boolean that defines whether the detail view should be showing, then attach it to your main view as a modal sheet.

```swift
struct ContentView: View {
    
    @State private var toDetailView : Bool = false
    
    var send : String = "Swift"
    
    var body: some View {
    
        Button("Go To Detail View",action: {
            self.toDetailView = true
        }).sheet(isPresented: $toDetailView){
            DetailView(receivedData: self.send)
        }
    }
}

struct DetailView : View {
    
    @Environment(\.presentationMode) var toContentView
    
    var receive : String?
    
    var body: some View {
        VStack{
            Text("Data : \(receive!)")
            Button("Go To Content View",action: {
                self.toContentView.wrappedValue.dismiss()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

# Navigation View
NavigationView is one of the most important components of a SwiftUI app, allowing us to push and pop screens with ease, presenting information in a clear, hierarchical way for users. In this article I want to demonstrate the full range of ways you can use NavigationView in your apps, including simple things like setting a title and adding buttons, but also programmatic navigation, creating split views, and more.

```swift
class Person{
    var name : String?
    var surname : String?
    
    init(){
        
    }
    
    init(name : String, surname : String){
        self.name = name
        self.surname = surname
    }
}

struct ContentView: View {
            
    var body: some View {
    
        NavigationView {
            VStack {
                NavigationLink(destination : DetailView(person: Person(name: "James", surname: "Cook"))){
                    Text("Go to Details View")
                }
            }.navigationTitle("Content View")
        }
    }
}

struct DetailView : View {
        
    var person = Person()
    
    var body: some View {
        VStack{
            Text("Name: \(person.name!)")
            Text("Surname: \(person.surname!)")
        }.navigationTitle("Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

# Navigation Bar

```swift
struct ContentView: View {            
    var body: some View {
        NavigationView {
            VStack {
                Text("Content View")
            }.navigationTitle("Content View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Help") {
                            print("Help")
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            print("Edit 1")
                        } label: {
                            Image(systemName: "pencil")
                        }
                        Button {
                            print("Edit 2")
                        } label: {
                            Label("Edit",systemImage: "pencil")
                        }
                    }
                }        
        }
    }
}
```

# Tab Bar
```swift
struct ContentView: View {            
    var body: some View {    
        NavigationView {
            TabView {
                VStack {
                    Text("First Screen").font(.largeTitle)
                }.tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }.tag(0)
                VStack {
                    Text("Second Screen").font(.largeTitle)
                }.tabItem {
                    Image(systemName: "2.circle")
                    Text("First")
                }.tag(1)
            }.navigationTitle("Content View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            print("Edit 1")
                        } label: {
                            Image(systemName: "3.circle")
                        }
                                            
                    }
                }
        }
    }
}
```
