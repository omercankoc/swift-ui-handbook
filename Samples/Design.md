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
