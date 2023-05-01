# HStack
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
# VStack
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
# ZStack
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

# Spacer
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
# Padding
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
```swift
Text("Sixth")
    .frame(width: 100, height: 100, alignment: .center)
```
# Geometry Reader 
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
