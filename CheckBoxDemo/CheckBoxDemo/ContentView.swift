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
  let style = CheckBox.Appearance(color: .green, backgroundColor: .pink, cornerRadius: 5, borderWidth: 5, style: .big)

  let style2 = CheckBox.Appearance(color: .blue, backgroundColor: .clear, cornerRadius: 5, borderWidth: 5, style: .small)

  var body: some View {
    
    VStack {
      CheckBox(text:"This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!", textPosition: .right,isChecked: false, appearance: style ).font(.largeTitle).padding().foregroundColor(.yellow).lineLimit(10)
      
      CheckBox(text:"This is another checkbox", isChecked:true,appearance: style2, onCheck:{
        isChecked in
        print(isChecked)
      }).font(.body).padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
