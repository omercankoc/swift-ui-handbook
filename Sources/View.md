## Binding
Use a binding to create a two-way connection between a property that stores data, and a view that displays and changes the data. A binding connects a property to a source of truth stored elsewhere, instead of storing data directly. For example, a button that toggles between play and pause can create a binding to a property of its parent view using the Binding property wrapper.
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

## Text
```swift
 struct ContentView: View {
     var body: some View {
         Text("Hello, SwiftUI!")
             .font(.body)
             .bold()
             .foregroundColor(Color.black)
             .padding(.all,10)
             .background {
                 RoundedRectangle(cornerRadius: 10)
                     .stroke(Color.black)
                     .frame(width: 200, height: 50, alignment: .center)
             }
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Text.png "Text")
## TextField
```swift
struct ContentView: View {
     
    @State private var username : String = ""
    @State private var password : String = ""
         
    var body: some View {
        VStack {
            TextField("Username",text: $username)
                .padding(.leading,10)
                .keyboardType(.numberPad)
                .frame(width: 300, height: 40, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black)
                }
            SecureField("Password",text: $password)
                .padding(.leading,10)
                .keyboardType(.default)
                .frame(width: 300, height: 40, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black)   
                }
        }
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/TextField.png "TextField")

## Button
```swift
struct ContentView: View {
    var body: some View {
        Button {
            print("Added!")
        } label: {
            HStack(spacing:5) {
                Image(systemName: "plus")
                Text("Add")
            }
            .frame(width: 90, height: 30, alignment: .center)
            .padding(.all,10)
            .foregroundColor(.black)
            .background(.green)
            .cornerRadius(20)
        }
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Button.png "Button")

```swift
struct ContentView: View {
    var body: some View {
        Button {
            print("Added!")
        } label: {
            HStack {
                Image(systemName: "plus")
                Text("Add")
            }
            .frame(width: 200, height: 30, alignment: .center)
            .padding(.all,10)
            .foregroundColor(.black)
            .background { RoundedRectangle(cornerRadius: 20).stroke(.black)}
            .cornerRadius(20)
        }
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/StrokeButton.png "Button")

## Toggle
```swift
struct ContentView: View {
    
    @State private var logic : Bool = false
    
    var body: some View {
        HStack {
            Toggle(isOn: $logic){
                Text("Logic : ")
            }
            
            if logic {
                Text("TRUE")
            } else {
                Text("FALSE")
            }
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Toggle.png "Toggle")

## Picker
```swift
struct ContentView: View {
    
    @State private var select : Int = 0
    
    var body: some View {
        VStack {
            Picker(selection: $select, label: Text("")){
                Text("First").tag(0)
                Text("Second").tag(1)
                Text("Third").tag(2)
            }
            .pickerStyle(.wheel)
            
            Text("Select : \(select)")
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Wheel.png "Wheel")

```swift
.pickerStyle(.segmented)
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Segmented.png "Segmented")

```swift
.pickerStyle(.menu)
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Menu.png "Menu")

## Stepper
```swift
struct ContentView: View {
    
    @State private var value : Int = 0
    
    var body: some View {
        VStack {
            Stepper("Run +-1",value: $value,in:0...11)
            Stepper("Run +-2", onIncrement: { self.value = self.value + 2 },onDecrement: { self.value = self.value - 2 })
            Text("Select : \(value)")
        }.padding(.all,10)
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Stepper.png "Stepper")

## Slider
```swift
struct ContentView: View {
    
    @State private var value : Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...10,step: 1)
            Text("Select : \(Int(value))")
        }.padding(.all,10)
    }
}
```
![image](https://github.com/omercankoc/swift-ui-handbook/blob/main/Images/Slider.png "Slider")

## Gesture Recognizer
```swift
struct ContentView: View {
    
    @State private var status : String = ""
        
    var body: some View {
        VStack(spacing : 10) {
            Text("Click")
                .onTapGesture { self.status = "One" }
                .onLongPressGesture { self.status = "Long" }
                .frame(width: 100, height: 50, alignment: .center)
                .background { RoundedRectangle(cornerRadius: 10).stroke(.black) }
            Text("\(status)")
        }
    }
}
```
## Image
Use an Image instance when you want to add images to your SwiftUI app. You can create images from many sources.
```swift
struct ContentView: View {
    var body: some View {
        Image("swift")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .center)
    }
}
```
