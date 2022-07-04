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
## Sample
```swift
struct HorizontalFlightsView: View {
    
    @State private var textList = [String]()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(textList,id: \.self){ item in
                    NavigationLink( destination: DetailView(message: item)){
                        RowView(text: item)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Text List")
            .navigationBarTitleDisplayMode(.inline)
                
        }
        .onAppear(){
            self.textList = ["C","C++","Objective C", "Objective C++","Swift"]
        }
    }
    
    func deleteItem(at offsets : IndexSet){
        self.textList.remove(atOffsets: offsets)
    }
}

struct DetailView : View {   
    var message : String    
    var body: some View {
        HStack {
            Text(message)
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
