# Widgets

## Text
```swift
struct MainView : View {
    var body: some View {
        Text("Hello, world!")
            .font(.body)
            .bold()
            .foregroundColor(Color.black)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black)
                    
            }
            .frame(width: 100, height: 50, alignment: .center)
    }
}
```
## Button
```swift
struct MainView : View {
    var body: some View {
        Button {
            print("Added!")
        } label: {
            HStack(spacing:5) {
                Image(systemName: "plus")
                Text("Add")
                    
            }
            .padding(.all,10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue)
                    
            }
        }
    }
}
```
## TextField
```swift
struct LoginView : View {
    
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
## Toggle
```swift
struct HorizontalFlightsView: View {
    
    @State private var logic : Bool = false
    
    var body: some View {
        VStack{
            HStack {
                Toggle(isOn: $logic){
                    Text("Logic : ")
                }
                .padding(.leading,20)
                .padding(.trailing,20)
            }
            if logic {
                Text("TRUE")
            } else {
                Text("FALSE")
            }
        }
    }
}
```
## Picker
```swift
struct MainView: View {
    
    @State private var select : Int = 0
    
    var body: some View {
        VStack {
            Picker(selection: $select, label: Text("")){
                Text("First").tag(0)
                Text("Second").tag(1)
                Text("Third").tag(2)
            }.pickerStyle(.inline)
            Text("Select : \(select)")
        }
    }
}
```
## Stepper
```swift
struct MainView: View {
    
    @State private var value : Int = 0
    
    var body: some View {
        VStack {
            Stepper("Run +-1",value: $value,in:0...11)
            Stepper("Run +-2", onIncrement: {
                self.value = self.value + 2
            },onDecrement: {
                self.value = self.value - 2
            })
            Text("Select : \(value)")
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```

