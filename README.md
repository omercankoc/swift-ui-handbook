

# Image
Use an Image instance when you want to add images to your SwiftUI app. You can create images from many sources.
```swift
var body: some View {
    Image("swift")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height,
            alignment: .center)
}
```

# List
A List is a container that presents rows of data arranged in a single column.
```swift
let testArray = ["C","C++","Objective C","Swift"]
var body: some View {
    List (testArray,id: \.self) { element in
        Image("apple")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
        Text(element)
            .font(.body)
    }
}
```
```swift
let testArray = ["C","C++","Objective C","Swift"]
var body: some View {
    List {
        ForEach(testArray, id: \.self){ element in
            Text(element)
                .font(.body)
        }
    }
}
```
# Button
You create a button by providing an action and a label. The action is either a method or closure property that does something when a user clicks or taps the button. 
```swift
@State var name = "Omer"
var body: some View {
    VStack {
        Text(name)
            .padding()
            .font(.title)            
        Button(action: {
            self.name = "Omer Koc"
        }) {
            Text("Message")
        }
    }
}
```
# Binding
Use a binding to create a two-way connection between a property that stores data, and a view that displays and changes the data. A binding connects a property to a source of truth stored elsewhere, instead of storing data directly. For example, a button that toggles between play and pause can create a binding to a property of its parent view using the Binding property wrapper.
```swift
@State var name = "Omer"
var body: some View {
    VStack {
        Text(name)
            .padding()
            .font(.title)
        TextField("placeholder",text: $name)
            .padding()
    }
}
```

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

# Observer Pattern
It is a pattern used for data sharing. It consists of three parts:
1. ObservableObject : Creates class for data sharing. It must inherit the ObservableObject class. The properties in it must be Published. This feature will be shared between all interfaces.
```swift
class Data : ObservableObject {
    @Published var counter : Int = 0
}
```
2. ObservedObject : An Observed Object object must be created for sharing.
```swift
@ObservedObject var item = Data()
```
3. Binding : A variable with Binding property must be defined to get the data.
```swift
@Binding var data : Int
```
Sample : 

```swift
class Counter : ObservableObject {
    @Published var counter : Int = 0
}

struct ContentView: View {
    
    @ObservedObject var item = Counter()
            
    var body: some View {
        NavigationView {
            VStack {
                Text("Counter : \(self.item.counter)")
                Button("Increase",action: {
                    self.item.counter += 1
                })
                NavigationLink(destination: DetailView(data: self.$item.counter)){
                    Text("Go to Details View")
                }
            }.navigationTitle("Content View")
        }
    }
}

struct DetailView : View {
        
    @Binding var data : Int
    
    var body: some View {
        VStack{
            Text("Counter \(data)")
            Button("Increase",action: {
                self.data += 1
            })
            
        }.navigationTitle("Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
