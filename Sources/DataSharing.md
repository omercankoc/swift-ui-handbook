# Observer Design Pattern
A design pattern that notifies all items in a list of changes in an object.
 - ObservableObject : Creates a class for data sharing. It must inherit the "ObservableObject" class. The properties in it must be "Published". This properties will be shared across all interfaces.
 - Published : Properties that belong to the "ObservableObject" class that will be published when changes occur.
```swift
class Data : ObservableObject {
    @Published var counter : Int = 0
}
```
- ObservedObject : When we create an instance from the class, it observes the changes in the properties of this class.
```swift
@ObservedObject var item = Data()
```
- Binding : Lets us declare that one value actually comes from elsewhere, and should be shared in both places.
```swift
@Binding var data : Int
```
Now, let's take an example in this regard.
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
                Button {
                    self.item.counter += 1
                } label: {
                    Text("Increase")
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.black)
                        .background(.green)
                        .cornerRadius(20)
                }
                NavigationLink(destination: DetailView(data: self.$item.counter)){
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
        
    @Binding var data : Int
    
    var body: some View {
        VStack{
            Text("Counter \(data)")
            Button {
                self.data += 1
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
