
## State
```swift
struct ContentView: View {
    
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
}
```
# Observer Object and Binding
A design pattern that notifies all items in a list of changes in an object.
 - ObservableObject : Creates a class for data sharing. It must inherit the "ObservableObject" class. The properties in it must be "Published". This properties will be shared across all interfaces.
 - Published : Properties that belong to the "ObservableObject" class that will be published when changes occur.
```swift
class Counter : ObservableObject {
    @Published var count : Int = 0
}
```
- ObservedObject : When we create an instance from the class, it observes the changes in the properties of this class.
```swift
@ObservedObject var counter = Counter()
```
- Binding : Lets us declare that one value actually comes from elsewhere, and should be shared in both places.
```swift
@Binding var count : Int
```
Now, let's take an example in this regard.
```swift
class Counter : ObservableObject {
    @Published var count : Int = 0
}

struct ContentView: View {
    @ObservedObject var counter = Counter()
            
    var body: some View {
        NavigationView {
            VStack {
                Text("Counter : \(self.counter.count)")
                Button {
                    self.counter.count += 1
                } label: {
                    Text("Increase")
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.black)
                        .background(.green)
                        .cornerRadius(20)
                }
                NavigationLink(destination: DetailView(count: self.$counter.count)){
                    Text("Go to Details View")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background {
                            RoundedRectangle(cornerRadius: 20).stroke(.black)
                        }
                        .foregroundColor(.black)
                }
            }
            .navigationTitle("Content View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView : View { 
    @Binding var count : Int
    
    var body: some View {
        VStack{
            Text("Counter \(count)")
            Button {
                self.count += 1
            } label: {
                Text("Increase")
                    .frame(width: 200, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(.green)
                    .cornerRadius(20)
            }
        }
        .navigationTitle("Detail")
    }
}
```


# State Object and Environment Object
Singleton design pattern is a design pattern that guarantees that only 1 object is created at runtime. Importantly, we must ensure that an instance exists and provide a global access point to it.

Environment Object is an implementation of this on the SwiftUI side. "EnvironmentObject" can be used for data that needs to be shared with many views in your application. This allows us to share model data wherever it is needed, while also ensuring that our views are automatically updated when that data changes.

Think of "EnvironmentObject" as a simpler way than using "ObservedObject" in many views. Instead of creating some data in view A, then passing it to view B, then passing it to view C, then to view D and finally using it, you can create the view in A and put it in the environment for views B, C, and D to appear. Will be automatically accessed.

 - ObservableObject : Creates a class for data sharing. It must inherit the "ObservableObject" class. The properties in it must be "Published". This properties will be shared across all interfaces.
 - Published : Properties that belong to the "ObservableObject" class that will be published when changes occur.

```swift
class Counter : ObservableObject {
    @Published var count : Int = 0
}
```
- StateObject : When we create an instance of the class, it observes changes in the properties of that class scope the entire application.
```swift
@StateObject var counter = Counter()
```
- EnvironmentObject : Represents the shared and observer class.
```swift
 @EnvironmentObject var counter : Counter
```
Now, let's take an example in this regard.
```swift
class Counter : ObservableObject {
    @Published var count : Int = 0
}

struct ContentView: View {
    @StateObject var counter = Counter()
            
    var body: some View {
        NavigationView {
            VStack {
                Text("Counter : \(self.counter.count)")
                Button {
                    self.counter.count += 1
                } label: {
                    Text("Increase")
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.black)
                        .background(.green)
                        .cornerRadius(20)
                }
                NavigationLink(destination: DetailView()){
                    Text("Go to Details View")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background {
                            RoundedRectangle(cornerRadius: 20).stroke(.black)
                        }
                        .foregroundColor(.black)
                }
            }
            .navigationTitle("Content View")
            .navigationBarTitleDisplayMode(.inline)
        }.environmentObject(counter)
    }
}

struct DetailView : View {
    @EnvironmentObject var counter : Counter
    
    var body: some View {
        VStack{
            Text("Counter \(counter.count)")
            Button {
                self.counter.count += 1
            } label: {
                Text("Increase")
                    .frame(width: 200, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(.green)
                    .cornerRadius(20)
            }
        }
        .navigationTitle("Detail")
    }
}
```
