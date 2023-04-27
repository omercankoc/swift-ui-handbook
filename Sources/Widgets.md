# State
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

# Text
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

# Label
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

# TextField
```swift
struct ContentView: View {
     
    @State private var username : String = ""
    
    var body: some View {
        VStack {
            TextField("Username",text: $username)
                .padding(.leading,10)
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
# SecureField
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
# TextEditor
```swift
struct ContentView: View {
     
    @State private var content: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $content)
            .foregroundColor(Color.gray)
            .font(.custom("HelveticaNeue", size: 13))
            .lineSpacing(5)
    }
}
```

# Button
### Angled
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

### Angled and Framed
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

# Toggle
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

# Picker
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

```swift
.pickerStyle(.segmented)
```

```swift
.pickerStyle(.menu)
```

# Stepper
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

# Slider
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

# Gesture Recognizer
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
# Image
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
# AsyncImage
 
### Declaration
```swift
struct AsyncImage<Content> where Content : View
```

### Overview
This view uses the shared URLSession instance to load an image from the specified URL, and then display it. For example, you can display an icon that’s stored on a server:

```swift
AsyncImage(url: URL(string: "https://example.com/icon.png"))
    .frame(width: 200, height: 200)
```

Until the image loads, the view displays a standard placeholder that fills the available space. After the load completes successfully, the view updates to display the image. In the example above, the icon is smaller than the frame, and so appears smaller than the placeholder.

You can specify a custom placeholder using init(url:scale:content:placeholder:). With this initializer, you can also use the content parameter to manipulate the loaded image. For example, you can add a modifier to make the loaded image resizable:

```swift
AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
    image.resizable()
} placeholder: {
    ProgressView()
}
.frame(width: 50, height: 50)
```

### Important
You can’t apply image-specific modifiers, like resizable(capInsets:resizingMode:), directly to an AsyncImage. Instead, apply them to the Image instance that your content closure gets when defining the view’s appearance.

To gain more control over the loading process, use the init(url:scale:transaction:content:) initializer, which takes a content closure that receives an AsyncImagePhase to indicate the state of the loading operation. Return a view that’s appropriate for the current phase:

```swift
AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
    if let image = phase.image {
        image // Displays the loaded image.
    } else if phase.error != nil {
        Color.red // Indicates an error.
    } else {
        Color.blue // Acts as a placeholder.
    }
}
```
