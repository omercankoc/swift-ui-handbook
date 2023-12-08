## HStack
A view that arranges its subviews in a horizontal line.
```swift
struct ContentView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("SwiftUI")
                .foregroundColor(Color.blue)
            Text("UIKit")
                .foregroundColor(Color.green)
        }
    }
}
```

## VStack
A view that arranges its subviews in a vertical line.
```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Swift")
                .foregroundColor(Color.blue)
            Text("Objective-C")
                .foregroundColor(Color.green)
        }
    }
}
```

## ZStack
A view that overlays its subviews, aligning them in both axes.
```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Hello")
                .foregroundColor(Color.blue)
            Text("World")
                .foregroundColor(Color.green)
        }
    }
}
```

## Grid
A container view that arranges other views in a two dimensional layout.
```swift
struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Red")
                ForEach(0..<4) { _ in Color.red }
            }
            GridRow {
                Text("Green")
                ForEach(0..<2) { _ in Color.green }
            }
            GridRow {
                Text("Blue")
                ForEach(0..<3) { _ in Color.blue }
            }
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
}
```

## Alignment and Spacing
```swift
VStack(alignment: .leading, spacing: 10){
    Text("First")
    Text("Second")
    Text("Third")
}
```
```swift
HStack(alignment: .top, spacing: 10){
    Text("First")
    Text("Second")
    Text("Third")
}
```

## Spacer
```swift
Text("First")
Spacer()
Text("Second")
```
```swift
VStack{
     Text("First")
     Spacer().frame(height: 10)
     Text("Second")
}
```
```swift
HStack{
     Text("First")
     Spacer().frame(width: 10)
     Text("Second")
}
``` 
## Padding
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
## Frame
```swift
Text("Sixth")
    .frame(width: 100, height: 100, alignment: .center)
```
## Geometry Reader 
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
## Scroll View
A scrollable view.
```swift
struct ContentView: View {
    var body: some View {
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
    }
}
```

## LazyHStack
A view that arranges its children in a line that grows horizontally, creating items only as needed.
```swift
struct ContentView: View {
    var body: some View {
        ScrollView() {
            LazyHStack(alignment: .center, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("\($0)")
                        .frame(width: 50, height: 50, alignment: .center)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .stroke(Color.red)
                        }
                }
            }
        }
    }
}
```

## LazyVStack
A view that arranges its children in a line that grows vertically, creating items only as needed.
```swift
struct ContentView: View {
    var body: some View {
        ScrollView() {
            LazyVStack(alignment: .center, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("\($0)")
                        .frame(width: 50, height: 50, alignment: .center)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .stroke(Color.red)
                        }
                }
            }
        }
    }
}
```

## LazyHGrid
A container view that arranges its child views in a grid that grows horizontally, creating items only as needed.
```swift
struct ContentView: View {
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                    Text(emoji(value))
                        .font(.largeTitle)
                }
            }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}
```

## LazyVGrid
A container view that arranges its child views in a grid that grows vertically, creating items only as needed.
```swift
struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                    Text(emoji(value))
                        .font(.largeTitle)
                }
            }
        }
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}
```

```swift
```

```swift
```

```swift
```
