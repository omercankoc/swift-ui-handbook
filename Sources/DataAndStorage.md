
## @State
A property wrapper type that can read and write a value managed by SwiftUI.

In UI operations, it serves to automatically update the UI object connected via Main Thread by understanding that the @State property wrapper variable changes automatically when we change its value.

```swift
struct ContentView: View {
    @State var input : String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(String(pow(Double(input) ?? 0.0, 2.0)))
                .padding()
                .font(.title)
                .frame(width: 200,height: 30, alignment: .center)
            TextField("Placeholder",text: $input)
                .padding()
                .multilineTextAlignment(.center)
                .frame(width: 200,height: 30, alignment: .center)
        }
    }
}
```

## @Binding
A property wrapper type that can read and write a value owned by a source of truth.
- Binding Recap($): It is used to define the feature that has a read-write connection between two views.

```swift
struct ContentView: View {
    @State var nameSurname: String = ""
    @State var sheet: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            TextField("Enter Name and Surname",text: $nameSurname)
                .multilineTextAlignment(.center)
                .frame(width: 300,height: 30, alignment: .center)
            Button {
                sheet.toggle()
            } label: {
                Text("Open Sheet")
            }
        }
        .sheet(isPresented: $sheet){
            SheetView(nameSurname: $nameSurname)
        }
    }
}

struct SheetView: View {
    @Binding var nameSurname: String
    @Environment(\.presentationMode) var sheetView
    
    var body: some View {
        VStack {
            TextField("Name and Surname", text: $nameSurname)
                .multilineTextAlignment(.center)
                .frame(width: 300,height: 30, alignment: .center)
            Button {
                self.sheetView.wrappedValue.dismiss()
            } label: {
                Text("Close Sheet")
            }
        }
    }
}
```
 
## @ObservableObject
Creates a class for data sharing. It must inherit the "ObservableObject" class. The properties in it must be "Published". This properties will be shared across all interfaces.
 
## @Published 
Properties that belong to the "ObservableObject" class that will be published when changes occur.

```swift
class Counter : ObservableObject {
    @Published var count : Int = 0
}
```

## @ObservedObject
A property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.

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

## @StateObject
When we create an instance of the class, it observes changes in the properties of that class scope the entire application.

## @EnvironmentObject 
A property wrapper type for an observable object that a parent or ancestor view supplies.

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
        }
        .environmentObject(counter)
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
