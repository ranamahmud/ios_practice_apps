//
//  ContentView.swift
//  Bulls Eye
//
//  Created by Md Rana Mahmud on 24/5/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import SwiftUI

struct ContentView: View {

@State var alertIsVisible = false
@State var sliderValue: Double = 50
@State var target: Int = Int.random(in: 1...100)
@State var score = 0
@State var round = 1
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct LabelStyle: ViewModifier{
        func body(content: Content) -> some View{
            content.foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier{
        func body(content: Content) -> some View{
            content.foregroundColor(Color.yellow)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct Shadow: ViewModifier{
           func body(content: Content) -> some View{
               content
               .shadow(color: Color.black, radius: 5, x: 2, y: 2)
           }
       }
    
    struct ButtonLargeTextSyle: ViewModifier{
           func body(content: Content) -> some View{
               content.foregroundColor(Color.black)
               .font(Font.custom("Arial Rounded MT Bold", size: 18))
           }
       }
    
    struct ButtonSmallTextSyle: ViewModifier{
              func body(content: Content) -> some View{
                  content.foregroundColor(Color.black)
                  .font(Font.custom("Arial Rounded MT Bold", size: 12))
              }
          }
var body: some View {
    VStack {
        VStack {
            VStack {
                Spacer()
                // Target Row
                HStack {
                    Text("Put the bullseye as close as you can to:")
                        .fontWeight(.semibold).modifier(LabelStyle())
                      
                    Text("\(target)").modifier(ValueStyle())
                }
                Spacer()
                // Slider Row
                HStack{
                    Text("1")
                      .modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100)
                    Text("100")
                        .modifier(LabelStyle())
                }
                Spacer()
                // Button Row
                Button(action: {
                    self.alertIsVisible = true
                    self.score = self.score + self.pointsForCurrentRound()
                    
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me"/*@END_MENU_TOKEN@*/).modifier(ButtonLargeTextSyle())
                }.alert(isPresented: $alertIsVisible){
                    ()-> Alert in
                    return Alert(title: Text(alertTitle()), message: Text(
                        "The slider value is \(sliderValueRounded()).\n" +
                        "You scored \(pointsForCurrentRound()) points this round."
                        ), dismissButton: .default(Text("Awesome")){
                            self.target = Int.random(in: 1...100)
                            self.round += 1

                        })
                    }.background(Image("Button")).modifier(Shadow())
                
                // Score Row
            }
           
        }
        Spacer()
        HStack {
           Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack{
                Image("StartOverIcon")
                Text("Start Over").modifier(ButtonSmallTextSyle())

            }
            }.background(Image("Button")).modifier(Shadow())
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Score:"/*@END_MENU_TOKEN@*/).modifier(LabelStyle())
            Text("\(score)").modifier(ValueStyle())
            Spacer()

            Text("Round:").modifier(LabelStyle())
            Text("\(round)").modifier(ValueStyle())
            Spacer()
            NavigationLink(destination: AboutView()){
                HStack{
                    Image("InfoIcon")
                    Text("Info").modifier(ButtonSmallTextSyle())

                }
            }.background(Image("Button")).modifier(Shadow())
        }.padding(.bottom, 20)
        
    }.background(Image("Background"), alignment: .center)
    .accentColor(midnightBlue)
    .navigationBarTitle("Bullseye")
}
    
    func pointsForCurrentRound() -> Int{
    let maximumScore = 100
    let difference = amountOff()
    let bonus: Int
        if difference == 0{
            bonus = 100
        }else if difference == 1{
            bonus = 50
        } else{
            bonus = 0
        }
        
        return maximumScore - difference + bonus
        
    }
    
    func amountOff() -> Int {
        abs(self.target - sliderValueRounded())
    }
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
   
    func alertTitle() -> String{
        let difference = amountOff()
        let title: String
        if difference == 0{
            title = "Perfect"
        } else if difference < 5{
            title = "You almost had it!"
        } else if difference <= 10{
            title = "Not bad"
        } else{
            title = "Are you even trying!"
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
}
}
