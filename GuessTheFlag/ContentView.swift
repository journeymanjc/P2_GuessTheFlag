//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jae Cho on 1/31/22.
//

import SwiftUI

struct ContentView: View {
	@State private var userScore = 0
	@State private var numberOfAttempts = 0
	@State private var showingFinalResult = false
	@State private var showingScore = false
	@State private var scoreTitle = ""
	@State private var animationAmount = 0.0
	@State private var flagTapped = 0
	@State private var fadeInOut = 1.0
	
	@State private var countries = ["Estonia","France","Germany", "Ireland", "Italy",
						  "Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
	@State private var correctAnswer = Int.random(in: 0...2)
	
	let labels = [
		 "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
		 "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
		 "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
		 "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
		 "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
		 "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
		 "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
		 "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
		 "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
		 "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
		 "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
	]
	
	
	var body: some View {
		
		ZStack {
//			LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
//				.ignoresSafeArea()
	
			RadialGradient(stops: [
				.init(color: Color(red:0.1, green:0.2, blue:0.45), location: 0.3),
				.init(color: Color(red:0.76, green:0.15,blue:0.26), location: 0.3),
			], center: .top, startRadius: 200, endRadius: 700)
				.ignoresSafeArea()
			VStack{
				Spacer()
				Text("Guess the Flag")
					.titleStyleBlue()
				
				VStack(spacing:15){
					VStack{
						Group{
							Text("Tap the flag of")
								.font(.subheadline.weight(.heavy))
								.foregroundStyle(.secondary)
							Text(countries[correctAnswer])
								.font(.largeTitle.weight(.semibold))
						}
						
					} //VStack
					ForEach(0..<3){ number in
						Button {
							if numberOfAttempts < 9{
								flagTapped = number
									withAnimation {
										animationAmount += 360
										fadeInOut = 0.25
									}
								flagTapped(number)

							}else{
								resetGame()
							}
							
						} label: {
							FlagImage(country: countries[number])
								.accessibilityLabel(labels[countries[number], default: "Unknown flag"])

						}
						.rotation3DEffect(.degrees(flagTapped == number ? animationAmount : 0), axis: (x:0,y:1,z:0))
						.opacity(flagTapped == number ? 1.0 : fadeInOut )
											}
					
				} //VSTACK
				.frame(maxWidth: .infinity)
				.padding(.vertical, 20)
				.background(.regularMaterial)
				.clipShape(RoundedRectangle(cornerRadius: 20))
				.alert(scoreTitle, isPresented: $showingScore){
					Button("Continue", action: askQuestion)
				} message: {
					Text("Your score is \(userScore)")
				}
				.alert(scoreTitle, isPresented: $showingFinalResult){
					Button("Reset", action: resetGame)
				} message: {
					Text("Your final score is \(userScore)")
				}

				
				Spacer()
				Spacer()
				Text("Score \(userScore)")
					.foregroundColor(.white)
					.font(.title.bold())
				Spacer()
			} //VSTACK
			.padding()
		} //ZSTACK
		
	}
	
	func flagTapped(_ number: Int){
		

		numberOfAttempts += 1
		if numberOfAttempts < 8{
			if number == correctAnswer{
				scoreTitle = "Correct"
				userScore += 1
			}else {
				scoreTitle = "Wrong That's the flag of \(countries[number])"
				userScore -= 1
			}
			showingScore = true
		}else{
			scoreTitle = "Game Over"
			showingFinalResult = true
		}
		
		
		
	}
	
	func resetGame(){
		userScore = 0
		numberOfAttempts = 0
		
	}
	
	func askQuestion(){
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
	}
}



struct FlagImage : View{
	var country: String
	
	var body: some View{
		Image(country)
			.renderingMode(.original)
			.clipShape(Capsule())
			.shadow(radius: 5)
	}
}



struct BlueTitle: ViewModifier{
	
	func body(content: Content) -> some View{
		content
			.font(.largeTitle.weight(.bold))
			.foregroundColor(.blue)
	}
}

extension View{
	func titleStyleBlue() -> some View{
		modifier(BlueTitle())
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 13 Mini")
	}
}
