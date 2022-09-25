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
## Button
You create a button by providing an action and a label. The action is either a method or closure property that does something when a user clicks or taps the button.
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
## Toggle
```swift
struct ContentView: View {
    
    @State private var logic : Bool = false
    
    var body: some View {
        HStack {
            Toggle(isOn: $logic){ Text("Logic : ") }
            if logic { Text("TRUE") } else { Text("FALSE") }
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```
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
            }.pickerStyle(.wheel)
            Text("Select : \(select)")
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```
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
