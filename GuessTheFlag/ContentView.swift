//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jae Cho on 1/31/22.
//

import SwiftUI

struct ContentView: View {
	@State private var showingAlert: Bool = false
	
    var body: some View {
		 ZStack{
			 VStack{
				 Color.red
				 Color.blue
				 
				 VStack{
					 Button("Button 1"){
						 showingAlert = true
						 
					 }
					 .buttonStyle(.bordered)
					 Button("Button 2", role: .destructive){}
					 .buttonStyle(.bordered)
					 Button("Button 3", role: .destructive){}
					 .buttonStyle(.borderedProminent)
					 
					 Button{
						 print("Button was tapped")
					 } label: {
						 Text("Tap me!")
							 .padding()
							 .foregroundColor(.white)
							 .background(.red)
					 }
					 .alert("Important message", isPresented: $showingAlert){
						 Button("Delete", role: .destructive) {}
						 Button("Cancel", role:.cancel) {}

					 } message: {
						 Text("Hows it going")
					 }
				 }
			 }
			 
			 Text("Your Content")
				 .foregroundStyle(.secondary)
				 .padding(20)
				 .background(.ultraThinMaterial)
			 
			 
		 }
		 

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			 .previewDevice("iPhone 13 Mini")
    }
}
