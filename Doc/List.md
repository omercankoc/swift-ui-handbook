## Static List
```swift
struct ListView: View {    
    var body: some View {
        List {
            RowView(text: "United Kingtom")
            RowView(text: "Germany")
            RowView(text: "France")
            RowView(text: "Italy")
            RowView(text: "Spain")
        }
    }
}
    
struct RowView : View {  
    var text : String = ""   
    var body: some View {
        Text("\(text)")
    }
}
```
## Dynamic List
```swift
struct ListView: View {   
    @State private var textList = [String]()    
    var body: some View {        
        NavigationView {
            List {
                ForEach(textList,id: \.self){ item in
                    RowView(text: item)
                }
            }.navigationTitle("Text List")
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear(){
            self.textList = ["C","C++","Objective C", "Objective C++","Swift"]
        }
    }
}
    
struct RowView : View {   
    var text : String = ""    
    var body: some View {
        Text("\(text)")
    }
}
```
