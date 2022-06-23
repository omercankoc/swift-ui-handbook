# Stack

Individually, HStack, VStack, and ZStack are simple views. HStack positions views in a horizontal line, VStack positions them in a vertical line, and ZStack overlays views on top of one another.

## HStack
```swift
var body: some View {
    HStack {
        Text("Hello, world!")
            .padding()
            .font(.title)
            .foregroundColor(Color.blue)
        Text("Hello, SwiftUI")
            .padding()
            .foregroundColor(Color.green)
    }
}
```
## VStack
```swift
var body: some View {
    VStack {
        Text("Hello, world!")
            .padding()
            .font(.title)
            .foregroundColor(Color.blue)
        Text("Hello, SwiftUI")
            .padding()
            .foregroundColor(Color.green)
    }
}
```
## ZStack
```swift
var body: some View {
    ZStack {
        Text("Hello, world!")
            .padding()
            .font(.title)
            .foregroundColor(Color.blue)
        Text("Hello, SwiftUI")
            .padding()
            .foregroundColor(Color.green)
    }
}
```

# Alignment and Spacing

Alignment : Aligns visual objects within the design space. By default, visual objects are "center" aligned.

Spacing : It leaves space between the visual objects inside. It does not leave a gap between the design area and the visual object.
- If we are working in VStack, "leading" aligns to left, "trailing" aligns to right, "center" aligns in the mid.
```swift
VStack(alignment: .leading, spacing: 10){
    Text("First")
    Text("Second")
    Text("Third")
}
```
- If we are working in HStack, "top" aligns to up, "buttom" aligns down, "center" aligns in the mid.
```swift
HStack(alignment: .top, spacing: 10){
    Text("First")
    Text("Second")
    Text("Third")
}
```

# Spacer
- Used to leave space between visual objects.
- The initial state leaves a default amount of space.
```swift
Text("First")
Spacer()
Text("Second")
```
- In VStack, the space will be in vertical position.
```swift
VStack{
     Text("First")
     Spacer().frame(height: 10)
     Text("Second")
}
```
- In HStack, the space will be in horizontal position.
```swift
HStack{
     Text("First")
     Spacer().frame(width: 10)
     Text("Second")
}
``` 

# Padding
It is used to leave space around the visual object.
```swift
HStack{
    Text("First").padding(.top,10)
    Text("Second").padding(.bottom,10)
    Text("Third").padding(.leading,10)
    Text("Fourth").padding(.trailing,10)
    Text("Fifth").padding(.all,5)
    Text("Sixth").padding()
}
```
# Frame
- By default, the visual objects field is defined in as many fields as is sufficient.
- The area of visual objects can be changed at will.
- If ".infinity" is written instead of numeric field, it will occupy the whole field.
```swift
Text("Sixth")
    .frame(width: 100, height: 100, alignment: .center)
```

# Geometry Reader 
A class used to get the width and height of the screen. With the help of this class we can dynamically scale visual objects.
```swift
GeometryReader { geometry in
    VStack(){
        Text("Swift")
        Text("Objective C")
        Text("C++")
        Text("C")
    }.frame(width: geometry.size.width/3, height: geometry.size.height/10, alignment: .center)    
}
```

# Scroll View
If the design occupies a larger area than the screen, the automatic scrolling feature is turned on. By default it works vertically but can also be used horizontally.
```swift
GeometryReader { geometry in
    ScrollView(.vertical) {
        VStack(alignment: .center, spacing: 5){
            ForEach(0...10, id: \.self){ iterator in
                Text("ITEM : \(iterator)")
                    .font(.body)
                    .frame(width: geometry.size.width, height: geometry.size.height / 5, alignment: .center)
                    .background(Color.green)
            }
        }
    }
}
```

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
