//
//  TextModifier.swift
//  OnlineLearning
//
//  Created by 우전 on 2022/10/03.
//

import Foundation
import SwiftUI

struct TextModifier: ViewModifier {
  let font: UIFont?
  let lineHeight: CGFloat

  func body(content: Content) -> some View {
    content
      .lineSpacing(lineHeight - (font?.lineHeight ?? 0.0))
      .padding(.vertical, (lineHeight - (font?.lineHeight ?? 0.0)) / 2)
  }
}
