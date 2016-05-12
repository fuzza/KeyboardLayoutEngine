//
//  DefaultKeyboardLayout.swift
//  KeyboardLayoutEngine
//
//  Created by Cem Olcay on 11/05/16.
//  Copyright © 2016 Prototapp. All rights reserved.
//

import UIKit

// MARK: - Layout Style
public var DefaultKeyboardLayoutStyle = KeyboardLayoutStyle(
  topPadding: 10,
  bottomPadding: 4,
  rowPadding: 12,
  backgroundColor: UIColor(red: 208.0/255.0, green: 213.0/255.0, blue: 219.0/255.0, alpha: 1))

// MARK: - Row Style
public var DefaultKeyboardRowStyle = KeyboardRowStyle(
  leadingPadding: 3,
  trailingPadding: 3,
  buttonsPadding: 6)

public var DefaultKeyboardSecondRowStyle = KeyboardRowStyle(
  leadingPadding: 22,
  trailingPadding: 22,
  buttonsPadding: 6)

public var DefaultKeyboardChildRowStyle = KeyboardRowStyle(
  leadingPadding: 12,
  trailingPadding: 12,
  buttonsPadding: 6)

// MARK: - Button Style
public var DefaultKeyboardSpaceButtonStyle = KeyboardButtonStyle(
  font: UIFont.systemFontOfSize(15),
  showsPopup: false)

public var DefaultKeyboardBackspaceButtonStyle = KeyboardButtonStyle(
  backgroundColor: UIColor(red: 180.0/255.0, green: 188.0/255.0, blue: 201.0/255.0, alpha: 1),
  imageSize: 20,
  showsPopup: false)

public var DefaultKeyboardShiftButtonStyle = KeyboardButtonStyle(
  backgroundColor: UIColor(red: 180.0/255.0, green: 188.0/255.0, blue: 201.0/255.0, alpha: 1),
  imageSize: 20,
  showsPopup: false)

public var DefaultKeyboardGlobeButtonStyle = KeyboardButtonStyle(
  backgroundColor: UIColor(red: 180.0/255.0, green: 188.0/255.0, blue: 201.0/255.0, alpha: 1),
  imageSize: 20,
  showsPopup: false)

public var DefaultKeyboardReturnButtonStyle = KeyboardButtonStyle(
  backgroundColor: UIColor(red: 172.0/255.0, green: 179.0/255.0, blue: 201.0/255.0, alpha: 1),
  font: UIFont.systemFontOfSize(15),
  showsPopup: false)

public var DefaultKeyboardNumbersButtonStyle = KeyboardButtonStyle(
  backgroundColor: UIColor(red: 180.0/255.0, green: 188.0/255.0, blue: 201.0/255.0, alpha: 1),
  font: UIFont.systemFontOfSize(15),
  showsPopup: false)

public var DefaultKeyboardKeyButtonStyle = KeyboardButtonStyle(showsPopup: true)

// MARK: - Identifier
public enum DefaultKeyboardIdentifier: String {
  case Space = "Space"
  case Backspace = "Backspace"
  case Globe = "Globe"
  case Return = "Return"
  case Numbers = "Numbers"
  case Letters = "Letters"
  case Symbols = "Symbols"
  case Shift = "Shift"
  case ShiftToggled = "ShiftToggled"
  case ShiftToggledOnce = "ShiftToggledOnce"
}

// MARK: - DefaultKeyboardLayout
public enum DefaultKeyboardLayout {
  case Uppercase
  case UppercaseToggled
  case Lowercase
  case Numbers
  case Symbols

  public var keyboardLayout: KeyboardLayout {
    switch self {
    case .Uppercase:
      return getUppercaseKeyboardLayout(shiftToggled: false)
    case .UppercaseToggled:
      return getUppercaseKeyboardLayout(shiftToggled: true)
    case .Lowercase:
      return getLowercaseKeyboardLayout()
    case .Numbers:
      return getNumbersKeyboardLayout()
    case .Symbols:
      return getSymbolsKeyboardLayout()
    }
  }

  private func getUppercaseKeyboardLayout(shiftToggled toggled: Bool) -> KeyboardLayout {
    return KeyboardLayout(
      style: DefaultKeyboardLayoutStyle,
      rows: [
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(type: .Key("Q"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("W"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("E"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("R"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("T"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("Y"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("U"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("I"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("O"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("P"), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardSecondRowStyle,
          characters: [
            KeyboardButton(type: .Key("A"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("S"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("D"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("F"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("G"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("H"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("J"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("K"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("L"), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Image(UIImage(named: toggled ? "shiftToggled" : "shiftToggledOnce", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardShiftButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: toggled ? DefaultKeyboardIdentifier.ShiftToggled.rawValue : DefaultKeyboardIdentifier.ShiftToggledOnce.rawValue),
            KeyboardRow(
              style: DefaultKeyboardChildRowStyle,
              characters: [
                KeyboardButton(type: .Key("Z"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("X"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("C"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("V"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("B"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("N"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("M"), style: DefaultKeyboardKeyButtonStyle),
              ]
            ),
            KeyboardButton(
              type: .Image(UIImage(named: "backspace", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardBackspaceButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Backspace.rawValue),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Text("123"),
              style: DefaultKeyboardNumbersButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Numbers.rawValue),
            KeyboardButton(
              type: .Image(UIImage(named: "globe", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardGlobeButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Globe.rawValue),
            KeyboardButton(
              type: .Text("space"),
              style: DefaultKeyboardSpaceButtonStyle,
              identifier: DefaultKeyboardIdentifier.Space.rawValue),
            KeyboardButton(
              type: .Text("return"),
              style: DefaultKeyboardReturnButtonStyle,
              width: .Relative(percent: 0.18),
              identifier: DefaultKeyboardIdentifier.Return.rawValue),
          ]
        ),
      ]
    )
  }

  private func getLowercaseKeyboardLayout() -> KeyboardLayout {
    return KeyboardLayout(
      style: DefaultKeyboardLayoutStyle,
      rows: [
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(type: .Key("q"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("w"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("e"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("r"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("t"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("y"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("u"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("i"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("o"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("p"), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardSecondRowStyle,
          characters: [
            KeyboardButton(type: .Key("a"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("s"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("d"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("f"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("g"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("h"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("j"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("k"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("l"), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Image(UIImage(named: "shift", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardShiftButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Shift.rawValue),
            KeyboardRow(
              style: DefaultKeyboardChildRowStyle,
              characters: [
                KeyboardButton(type: .Key("z"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("x"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("c"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("v"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("b"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("n"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("m"), style: DefaultKeyboardKeyButtonStyle),
              ]
            ),
            KeyboardButton(
              type: .Image(UIImage(named: "backspace", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardBackspaceButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Backspace.rawValue),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Text("123"),
              style: DefaultKeyboardNumbersButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Numbers.rawValue),
            KeyboardButton(
              type: .Image(UIImage(named: "globe", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardGlobeButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Globe.rawValue),
            KeyboardButton(
              type: .Text("space"),
              style: DefaultKeyboardSpaceButtonStyle,
              identifier: DefaultKeyboardIdentifier.Space.rawValue),
            KeyboardButton(
              type: .Text("return"),
              style: DefaultKeyboardReturnButtonStyle,
              width: .Relative(percent: 0.18),
              identifier: DefaultKeyboardIdentifier.Return.rawValue),
          ]
        ),
      ]
    )
  }

  private func getNumbersKeyboardLayout() -> KeyboardLayout {
    return KeyboardLayout(
      style: DefaultKeyboardLayoutStyle,
      rows: [
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(type: .Key("1"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("2"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("3"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("4"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("5"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("6"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("7"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("8"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("9"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("0"), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(type: .Key("-"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("/"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key(":"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key(";"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("("), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key(")"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("$"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("&"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("@"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("\""), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Text("#+="),
              style: DefaultKeyboardNumbersButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Symbols.rawValue),
            KeyboardRow(
              style: DefaultKeyboardChildRowStyle,
              characters: [
                KeyboardButton(type: .Key("."), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key(","), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("?"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("!"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key(","), style: DefaultKeyboardKeyButtonStyle),
              ]
            ),
            KeyboardButton(
              type: .Image(UIImage(named: "backspace", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardBackspaceButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Backspace.rawValue),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Text("ABC"),
              style: DefaultKeyboardNumbersButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Letters.rawValue),
            KeyboardButton(
              type: .Image(UIImage(named: "globe", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardGlobeButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Globe.rawValue),
            KeyboardButton(
              type: .Text("space"),
              style: DefaultKeyboardSpaceButtonStyle,
              identifier: DefaultKeyboardIdentifier.Space.rawValue),
            KeyboardButton(
              type: .Text("return"),
              style: DefaultKeyboardReturnButtonStyle,
              width: .Relative(percent: 0.18),
              identifier: DefaultKeyboardIdentifier.Return.rawValue),
          ]
        ),
      ]
    )
  }

  private func getSymbolsKeyboardLayout() -> KeyboardLayout {
    return KeyboardLayout(
      style: DefaultKeyboardLayoutStyle,
      rows: [
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(type: .Key("["), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("]"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("{"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("}"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("#"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("%"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("^"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("*"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("+"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("="), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(type: .Key("_"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("\\"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("|"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("~"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("<"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key(">"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("€"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("£"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("¥"), style: DefaultKeyboardKeyButtonStyle),
            KeyboardButton(type: .Key("•"), style: DefaultKeyboardKeyButtonStyle),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Text("123"),
              style: DefaultKeyboardNumbersButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Numbers.rawValue),
            KeyboardRow(
              style: DefaultKeyboardChildRowStyle,
              characters: [
                KeyboardButton(type: .Key("."), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key(","), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("?"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key("!"), style: DefaultKeyboardKeyButtonStyle),
                KeyboardButton(type: .Key(","), style: DefaultKeyboardKeyButtonStyle),
              ]
            ),
            KeyboardButton(
              type: .Image(UIImage(named: "backspace", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardBackspaceButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Backspace.rawValue),
          ]
        ),
        KeyboardRow(
          style: DefaultKeyboardRowStyle,
          characters: [
            KeyboardButton(
              type: .Text("ABC"),
              style: DefaultKeyboardNumbersButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Letters.rawValue),
            KeyboardButton(
              type: .Image(UIImage(named: "globe", inBundle: NSBundle(forClass: DefaultKeyboard.self), compatibleWithTraitCollection: nil)),
              style: DefaultKeyboardGlobeButtonStyle,
              width: .Relative(percent: 0.115),
              identifier: DefaultKeyboardIdentifier.Globe.rawValue),
            KeyboardButton(
              type: .Text("space"),
              style: DefaultKeyboardSpaceButtonStyle,
              identifier: DefaultKeyboardIdentifier.Space.rawValue),
            KeyboardButton(
              type: .Text("return"),
              style: DefaultKeyboardReturnButtonStyle,
              width: .Relative(percent: 0.18),
              identifier: DefaultKeyboardIdentifier.Return.rawValue),
          ]
        ),
      ]
    )
  }
}

