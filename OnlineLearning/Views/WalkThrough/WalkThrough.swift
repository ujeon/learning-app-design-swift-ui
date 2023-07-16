//
//  WalkThrough.swift
//  OnlineLearning
//
//  Created by 우전 on 2022/09/18.
//

import SwiftUI

struct WalkThrough: View {
  var title: String
  var description: String
  var imageSource: String
  
  var body: some View {
    VStack {
      Image(imageSource)
        .resizable()
        .frame(width: 260.0, height: 260.0)
      Spacer()
        .frame(height: 38)
      Text(title)
        .font(.custom("Poppins-Bold", size: 22))
        .multilineTextAlignment(.center)
      Spacer()
        .frame(height: 6)
      Text(description)
        .modifier(TextModifier(font: UIFont(name: "Poppins-Regular", size: 26), lineHeight: 4.0))
        .foregroundColor(Color.gray1)
        .multilineTextAlignment(.center)
    }
    .frame(width: UIScreen.main.bounds.size.width)
  }
}

struct WalkThrough_Previews: PreviewProvider {
  static var previews: some View {
    let title = "Numerous free \n trial courses"
    let description = "Free courses for you to find your way to learning"
    let imageSource =  "WalkThroughGuide01"
    WalkThrough(title: title, description: description, imageSource: imageSource)
  }
}
