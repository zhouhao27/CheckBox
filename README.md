# CheckBox

A SwiftUI CheckBox component.

![Screenshot](./images/demo.png)

# Installation

Install through Swift Package Manager.

# Example

## Example 1:

```
let style = CheckBoxAppearance(color: .green, backgroundColor: .pink, cornerRadius: 5, borderWidth: 5, style: .big, contentPosition: .right)

CheckBox(isChecked: false, appearance: style) {
  Text("This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!This is a checkbox!!!").font(.largeTitle).padding().foregroundColor(.yellow).lineLimit(10)
}
```

## Example 2:

```
let style = CheckBoxAppearance(color: .blue, backgroundColor: .clear, cornerRadius: 5, borderWidth: 5, style: .small)

CheckBox(isChecked:true,appearance: style, onCheck:{
  isChecked in
  print(isChecked)
}) {
  Text("This is another checkbox").font(.body).padding()
}
```

# TODO:

1. Wrap the style at the end, for example:

```
    CheckBox() {
        Text("This is a checkbox")
    }.appearance(MyStyle())
```

Please refer to [Composable styling in SwiftUI](https://mecid.github.io/2019/08/28/composable-styling-in-swiftui/)

2. Add event callback at the endm for example:

```
CheckBox() {
    Text("This is a checkbox")
  }.onCheck {
    checked in
    print("Is checked: \(checked)")
  }
}

```

