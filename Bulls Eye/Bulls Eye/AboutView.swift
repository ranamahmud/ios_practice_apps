//
//  AboutView.swift
//  Bulls Eye
//
//  Created by Md Rana Mahmud on 30/5/20.
//  Copyright © 2020 Rana. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    var backgroundColor = Color(red: 255.0, green: 214.0/255.0, blue: 179.0/255.0)
    struct AbouHeadingStyle: ViewModifier{
          func body(content: Content) -> some View{
              content.foregroundColor(Color.black)
              .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top, 20)
                .padding(.bottom, 20)
          }
      }
    
    struct AbouBodyStyle: ViewModifier{
            func body(content: Content) -> some View{
                content.foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                  .padding(.leading, 60)
                  .padding(.trailing, 60)
                    .padding(.bottom, 20)
            }
        }
    var body: some View {
        Group{
        VStack{
            Text("🎯 Bullseye 🎯").modifier(AbouHeadingStyle())
            
            Text("🎯 Your goal is to matchscore as close as possible 🎯").modifier(AbouBodyStyle())

            Text("🎯 Enjoy 🎯")

        }.navigationBarTitle("About Bullseye")
            .background(backgroundColor)}.background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
