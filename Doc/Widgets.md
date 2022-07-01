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
        .padding(.trailing,10)
        .padding(.leading,10)
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
        .padding(.trailing,10)
        .padding(.leading,10)
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
## Slider
```swift
struct MainView: View {
    
    @State private var value : Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...10,step: 1)
            Text("Select : \(Int(value))")
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```
## Gesture Recognizer
```swift
struct MainView: View {
    
    @State private var status : String = ""
        
    var body: some View {
        VStack(spacing : 10) {
            Text("Click")
                .onTapGesture {
                    self.status = "One"
                }
                .onLongPressGesture {
                    self.status = "Long"
                }
                .frame(width: 100, height: 100, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black)
                }
            Text("\(status)")
        }
        .padding(.trailing,10)
        .padding(.leading,10)
    }
}
```
## Date Picker and Time Picker
```swift
struct HorizontalFlightsView: View {
    
    @State private var format = Date()
    @State private var boolDate : Bool = false
    @State private var boolTime : Bool = false
    @State private var date = ""
    @State private var time = ""
    
    var body: some View {
        VStack(spacing : 10) {
            TextField("Date", text: $date)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onTapGesture {
                    self.boolDate = true
                    self.boolTime = false
                }
            TextField("Time",text: $time)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onTapGesture {
                    self.boolDate = false
                    self.boolTime = true
                }
            
            /*
             Set Date
             */
            if boolDate {
                DatePicker("",selection: $format,displayedComponents: .date).labelsHidden()
                
                HStack {
                    
                    Button {
                        self.boolDate = false
                        self.boolTime = false
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM/dd/yyyy"
                        let getDate = dateFormatter.string(from: self.format)
                        self.date = getDate
                        
                    } label: {
                        Text("Select Date")
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue)
                            }
                    }
                    
                    Button {
                        self.boolDate = false
                        self.boolTime = false
                    } label: {
                        Text("Close")
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue)
                            }
                    }
                }
            }
            
            /*
             Set Time
             */
            if boolTime {
                DatePicker("",selection: $format,displayedComponents: .hourAndMinute).labelsHidden()
                
                HStack {
                    
                    Button {
                        self.boolDate = false
                        self.boolTime = false
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "hh:mm"
                        let getTime = timeFormatter.string(from: self.format)
                        self.time = getTime
                        
                    } label: {
                        Text("Select Hour")
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue)
                            }
                    }
                    
                    Button {
                        self.boolDate = false
                        self.boolTime = false
                    } label: {
                        Text("Close")
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue)
                            }
                    }
                }
            }
            
        }.frame(width: 200, height: 200, alignment: .top)
        .padding(.leading,10)
        .padding(.trailing,10)
    }
}
```
