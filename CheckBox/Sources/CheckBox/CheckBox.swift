//
//  CheckBox.swift
//  CheckBoxDemo
//
//  Created by Hao Zhou on 6/9/19.
//  Copyright © 2019 Hao Zhou. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
public struct CheckBox: View {
  
  public struct Appearance {
    public enum Style {
      case big
      case small
      case medium
    }
    
    var color: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var style: Style
    
    public init(color: Color = Color.primary, backgroundColor: Color = Color.clear, cornerRadius: CGFloat = 5.0, borderWidth: CGFloat = 5.0, style: Style = .medium) {
      self.color = color
      self.backgroundColor = backgroundColor
      self.cornerRadius = cornerRadius
      self.borderWidth = borderWidth
      self.style = style
    }
  }

  public enum TextPosition {
    case left
    case right
  }
  
  var text: String
  var textPosition: TextPosition = .left
  
  @State private var isChecked: Bool = false
  var appearance: Appearance
  var onCheck: ((Bool) -> Void)?
  
  private func clicked() {
    self.isChecked.toggle()
    if let call = self.onCheck {
      call(self.isChecked)
    }
  }
  
  public init(text: String, textPosition: TextPosition = .left, isChecked: Bool = false, appearance: Appearance = Appearance(), onCheck: ((Bool) -> Void)? = nil) {
    self.text = text
    self.textPosition = textPosition
    // TODO: this doesn't work
//    self.isChecked = isChecked
    self.appearance = appearance
    self.onCheck = onCheck
  }
    
  public var body: some View {
    let size: CGFloat = appearance.style == .big ? 40: (appearance.style == .medium ? 30 : 20)
    let padding: CGFloat = appearance.style == .big ? 10: (appearance.style == .medium ? 8 : 5)
    
    return HStack {
      if textPosition == .left {
        Text(text)
      }
      Button(action: {
        self.clicked()
      }) {
        if isChecked {
          Image(systemName: "checkmark").resizable()
            .foregroundColor(appearance.color)
        }
      }
      .frame(width: size, height: size, alignment: .center)
      .padding(padding)
      .background(appearance.backgroundColor)
      .cornerRadius(appearance.cornerRadius)
      .foregroundColor(appearance.color)
      .overlay(
        RoundedRectangle(cornerRadius: appearance.cornerRadius)
          .stroke(appearance.color, lineWidth: appearance.borderWidth)
      )
      if textPosition == .right {
        Text(text)
      }
    }
  }
}

@available(iOS 13, *)
struct CheckBox_Previews: PreviewProvider {
  static var previews: some View {
    CheckBox(text: "Test")
  }
}
