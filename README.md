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
