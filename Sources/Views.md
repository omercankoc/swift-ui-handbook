## Text
A view that displays one or more lines of read-only text.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .font(.body)
            .bold()
            .frame(width: 150, height: 50, alignment: .center)
            .foregroundColor(Color.black)
            .background {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black)
            }
    }
}
```

## Label
A standard label for user interface items, consisting of an icon with a title.

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Label("Rain", systemImage: "cloud.rain")
            Label("Snow", systemImage: "snow")
            Label("Sun", systemImage: "sun.max")
        }
        .labelStyle(.titleAndIcon)
    }
}
```

## TextField
A control that displays an editable text interface.

```swift
struct ContentView: View {
    @State private var username : String = ""
    
    var body: some View {
        VStack {
            TextField("Username",text: $username)
                .padding(.leading, 10)
                .keyboardType(.alphabet)
                .frame(width: 300, height: 40, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black)
                }
        }
    }
}
```
## SecureField
A control into which the user securely enters private text.

```swift
struct ContentView: View {
    @State private var password : String = ""
         
    var body: some View {
        VStack {
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

## TextEditor
A view that can display and edit long-form text.

```swift
struct ContentView: View {
    @State private var content: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $content)
            .foregroundColor(Color.gray)
            .font(
                .custom("HelveticaNeue", size: 13)
            )
            .lineSpacing(5)
    }
}
```

## Button
A control that initiates an action.

- Angled and Filled
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
            .frame(width: 100, height: 40, alignment: .center)
            .foregroundColor(.black)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
            }
        }
    }
}
```

- Angled and Framed
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
            .frame(width: 100, height: 40, alignment: .center)
            .foregroundColor(.black)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black)
            }
        }
    }
}
```

## Toggle
A control that toggles between on and off states.

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
        .padding(.trailing,20)
        .padding(.leading,20)
    }
}
```

## Picker
A control for selecting from a set of mutually exclusive values.

```swift
struct ContentView: View {
    
    @State private var select : Int = 1
    
    var body: some View {
        VStack {
            Picker(selection: $select, label: Text("")){
                Text("First").tag(1)
                Text("Second").tag(2)
                Text("Third").tag(3)
            }
            .pickerStyle(.wheel)
            
            Text("Select : \(select)")
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```

```swift
.pickerStyle(.segmented)
```

```swift
.pickerStyle(.menu)
```

## Stepper
A control that performs increment and decrement actions.

```swift
struct ContentView: View {
    @State private var value : Int = 0
    
    var body: some View {
        VStack {
            Stepper("Run +-1",value: $value, in: 0...11)
            Stepper("Run +-2", 
                    onIncrement: {
                self.value = self.value + 2
            },
                    onDecrement: {
                self.value = self.value - 2
            })
            Text("Select : \(value)")
        }
        .padding(.all, 10)
    }
}
```

## Slider
A control for selecting a value from a bounded linear range of values.

```swift
struct ContentView: View {
    @State private var value : Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...10,step: 1)
            Text("Select : \(Int(value))")
        }
        .padding(.all,10)
    }
}
```

## GestureRecognizer
The base class for concrete gesture recognizers.

```swift
struct ContentView: View {
    @State private var status : String = "Gesture"
        
    var body: some View {
        VStack(spacing : 10) {
            Text(status)
                .onTapGesture {
                    self.status = "Tab Gesture"
                }
                .onLongPressGesture {
                    self.status = "Long Press Gesture"
                }
                .frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.green)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.green)
                }
        }
    }
}
```

## Image
A view that displays an image.

```swift
struct ContentView: View {
    var body: some View {
        Image("swift")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200, alignment: .center)
    }
}
```

## AsyncImage
A view that asynchronously loads and displays an image.

```swift
struct ContentView: View {
    var body: some View {
        AsyncImage(
            url: URL(string: "url")
        ){ image in
            image
                .resizable()
                .frame(width: 100, height: 100)
        } placeholder: {
            ProgressView()
        }
    }
}
```

### AsyncImage Phase
The current phase of the asynchronous image loading operation.

```swift
struct ContentView: View {
    var body: some View {
        AsyncImage(
            url: URL(string: "url")
        ){ phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            } else if phase.error != nil {
                Color.red
            } else {
                Color.blue
            }
        }
    }
}
```

## Menu
A control for presenting a menu of actions.

```swift
struct ContentView: View {
   
    @State var menuLabel : String = "Share"
    @State var menuImage : String = "paperplane"
   
    var body: some View {
        Menu {
            Button {
                log("Mail")
                self.menuLabel = "Mail"
                self.menuImage = "envelope"
            } label: {
                Label("Mail", systemImage: "envelope")
            }
            
            Button {
                log("Message")
                self.menuLabel = "Message"
                self.menuImage = "message"
            } label: {
                Label("Message", systemImage: "message")
            }
            
            Menu("More") {
                Button {
                    log("Whatsapp")
                    self.menuLabel = "Whatsapp"
                    self.menuImage = "arrow.up"
                } label: {
                    Label("Whatsapp", systemImage: "arrow.up")
                }
                
                Button {
                    log("Messenger")
                    self.menuLabel = "Messenger"
                    self.menuImage = "arrow.up"
                } label: {
                    Label("Messenger", systemImage: "arrow.up")
                }
                
                Button {
                    log("Telegram")
                    self.menuLabel = "Telegram"
                    self.menuImage = "arrow.up"
                } label: {
                    Label("Telegram", systemImage: "arrow.up")
                }
                
                Button {
                    log("WeChat")
                    self.menuLabel = "WeChat"
                    self.menuImage = "arrow.up"
                } label: {
                    Label("WeChat", systemImage: "arrow.up")
                }
            }
            
        } label: {
            Label(self.menuLabel, systemImage: self.menuImage)
        }
    }
    
    func log(_ key : String){
        print(key)
    }
}
```
