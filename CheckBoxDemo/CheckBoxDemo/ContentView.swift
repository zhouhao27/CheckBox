//
//  ContentView.swift
//  CheckBoxDemo
//
//  Created by Hao Zhou on 10/9/19.
//  Copyright © 2019 Hao Zhou. All rights reserved.
//

import SwiftUI
import CheckBox

struct ContentView: View {
  let style = CheckBoxAppearance(color: .green, backgroundColor: .pink, cornerRadius: 5, borderWidth: 5, style: .big, contentPosition: .right)

  let style2 = CheckBoxAppearance(color: .blue, backgroundColor: .clear, cornerRadius: 5, borderWidth: 5, style: .small)

  var body: some View {
        
    VStack {
      CheckBox(isChecked: false, appearance: style) {
        Text("This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!").font(.largeTitle).padding().foregroundColor(.yellow).lineLimit(10)
      }
      
      CheckBox(isChecked:true,appearance: style2, onCheck:{
        isChecked in
        print(isChecked)
      }) {
        Text("This is another checkbox").font(.body).padding()
      }
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
