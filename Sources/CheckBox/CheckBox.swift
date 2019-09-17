//
//  CheckBox.swift
//  CheckBoxDemo
//
//  Created by Hao Zhou on 6/9/19.
//  Copyright © 2019 Hao Zhou. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
public struct CheckBoxAppearance {
  public enum Style {
    case big
    case small
    case medium
  }
  
  public enum ContentPosition {
    case left
    case right
  }

  var color: Color
  var backgroundColor: Color
  var cornerRadius: CGFloat
  var borderWidth: CGFloat
  var style: Style
  var position: ContentPosition
  
  public init(color: Color = Color.primary, backgroundColor: Color = Color.clear, cornerRadius: CGFloat = 5.0, borderWidth: CGFloat = 5.0, style: Style = .medium, contentPosition: ContentPosition = .left) {
    self.color = color
    self.backgroundColor = backgroundColor
    self.cornerRadius = cornerRadius
    self.borderWidth = borderWidth
    self.style = style
    self.position = contentPosition
  }
}

@available(iOS 13, *)
public struct CheckBox<Content>: View where Content: View {
    
  @State private var isChecked: Bool = false
  private var isCheckedValue: Bool  // passed by init
  var appearance: CheckBoxAppearance
  var onCheck: ((Bool) -> Void)?
  var content: Content
  
  private func clicked() {
    self.isChecked.toggle()
    if let call = self.onCheck {
      call(self.isChecked)
    }
  }
  
  public init(isChecked: Bool = false, appearance: CheckBoxAppearance = CheckBoxAppearance(), onCheck: ((Bool) -> Void)? = nil,@ViewBuilder content: @escaping () -> Content) {
    self.isCheckedValue = isChecked
    self.appearance = appearance
    self.onCheck = onCheck
    self.content = content()
  }
    
  public var body: some View {
    let size: CGFloat = appearance.style == .big ? 40: (appearance.style == .medium ? 30 : 20)
    let padding: CGFloat = appearance.style == .big ? 10: (appearance.style == .medium ? 8 : 5)
    
    return HStack {
      if self.appearance.position == .left {
        content
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
      if self.appearance.position == .right {
        content
      }
    }.onAppear() {
      self.isChecked = self.isCheckedValue
    }
  }
}

@available(iOS 13, *)
struct CheckBox_Previews: PreviewProvider {
  static var previews: some View {
    
    CheckBox() {
      Text("Great!")
    }
  }
}
