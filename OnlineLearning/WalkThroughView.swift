//
//  ContentView.swift
//  OnlineLearning
//
//  Created by 우전 on 2022/09/18.
//

import SwiftUI

let walkThroughGuideTitle = ["Numerous free \n trial courses", "Quick and easy \n learning", "Create your own \n study plan"]
let walkThroughGuideDescription = ["Free courses for you to find your way to learning", "Easy and fast learning at any time to help you improve various skills", "Study according to the study plan, make study more motivated"]
let walkThroughGuideImageSource = ["WalkThroughGuide01", "WalkThroughGuide02", "WalkThroughGuide03"]

struct WalkThroughView: View {
  @State private var x : CGFloat = UIScreen.main.bounds.size.width
  @State private var count : CGFloat = 1
  @State private var screen = UIScreen.main.bounds.size.width
  
  var body: some View {
    
    ZStack {
      VStack {
        ZStack {
          Button(action: {
            self.count = -1
            self.x = self.screen * self.count
          }) {
            Text("Skip")
              .foregroundColor(Color.gray1)
          }
          .frame(width: 40, height: 45)
          .position(x: 314, y: 22.5)
          .hiddenConditionally(isHidden: self.count == -1)
        }
        .offset(y: 0)
        .frame(width: UIScreen.main.bounds.size.width, height: 45)
        
        Spacer()
          .frame(height: 12)
        
        HStack(spacing: 0) {
          ForEach(0..<3){ i in
            WalkThrough(
              title: walkThroughGuideTitle[i], description: walkThroughGuideDescription[i], imageSource: walkThroughGuideImageSource[i])
            .offset(x: self.x)
            .highPriorityGesture(DragGesture()
              .onChanged({(value) in
                if value.translation.width > 0 {
                  self.x = value.location.x
                }
                else {
                  self.x = value.location.x - self.screen
                  
                }
              })
                .onEnded({(value) in
                  if value.translation.width < 0 {
                    if -value.translation.width > (self.screen / 2) {
                      if self.count > -1 {
                        self.count -= 1
                      }
                      self.x = self.screen * self.count
                    } else {
                      self.x = self.screen * self.count
                    }
                  }
                  else {
                    if value.translation.width > (self.screen / 2) {
                      if self.count < 1 {
                        self.count += 1
                      }
                      self.x = self.screen * self.count
                    } else {
                      self.x = self.screen * self.count
                    }
                  }
                  
                })
            )
          }
        }
        .animation(.spring(), value: x)
        
        Spacer()
          .frame(height: 26)
        
        VStack {
          HStack {
            ForEach(0..<3){ i in
              let focused = abs(Int(Float(self.count) - 1.0)) == i
              Capsule()
                .fill(focused ? Color.blue1 : Color.blue2)
                .frame(width: focused ? 28 : 9, height: 5)
                .animation(Animation.easeInOut(duration: 0.3), value: x)
            }
          }
        }
        
        
        Spacer()
          .frame(height: 81.75)
        
        HStack {
          Button(action: {
            
          }) {
            Text("Sign up")
              .frame(width: 160.0, height: 50.0)
              .font(.system(size: 18))
              .foregroundColor(.white)
          }
          .background(Color.blue1)
          .cornerRadius(14.0)
          
          Button(action: {
            
          }) {
            Text("Log in")
              .foregroundColor(Color.blue1)
              .frame(width: 160.0, height: 50.0)
              .overlay(RoundedRectangle(cornerRadius: 14.0).stroke(Color.blue1, lineWidth: 2))
          }
          .cornerRadius(14.0)
          
        }
        .hiddenConditionally(isHidden: self.count != -1)
      }
    }
    
  }
}

struct WalkThroughView_Previews: PreviewProvider {
  static var previews: some View {
    WalkThroughView()
  }
}

extension View {
  func hiddenConditionally(isHidden: Bool) -> some View {
    isHidden ? AnyView(self.hidden()) : AnyView(self)
  }
}
