# List
A List is a container that presents rows of data arranged in a single column.
```swift
struct ContentView: View {
    let testArray = ["C","C++","Objective C","Swift"]
    var body: some View {
        List (testArray,id: \.self) { element in
            HStack {
                Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text(element)
                    .font(.body)
            }
        }
    }
}
```
```swift
struct ContentView: View {
    let testArray = ["C","C++","Objective C","Swift"]
    var body: some View {
        List {
            ForEach(testArray, id: \.self){ element in
                Text(element)
                    .font(.body)
            }
        }
    }
}
```
