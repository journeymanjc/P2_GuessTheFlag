# P2_GuessTheFlag
###### Day 20
- Color and setting a frame on color.  
  ``` ZStack {
        Color.red
          .frame(minWidth:200, maxWidth: .infinity, maxHeight: 200)
        Text("Your content")
    }```
- Gradient coloring.   
```LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)  ```
```RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)```
```AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)```

###### Day 21
- Different Button creation.   
```Button("Delete selection", role: .destructive, action: executeDelete)```
```Button {
    print("Edit button was tapped")
} label: {
    Label("Edit", systemImage: "pencil")
}```. 

- Alert messages. 
```Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK") { }
        }```. 
        
        
- Some other stuff. 
``` .ignoreSafeArea(), .clipShape(), .foreGroundColor(), .foregroundStyle()```. 
