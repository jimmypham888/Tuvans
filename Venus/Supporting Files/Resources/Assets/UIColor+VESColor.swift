// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
struct ColorName {
  let rgbaValue: UInt32
  var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 54% <br/> (0x0000008a)
  static let black54 = ColorName(rgbaValue: 0x0000008a)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 60% <br/> (0x00000099)
  static let black60 = ColorName(rgbaValue: 0x00000099)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 87% <br/> (0x000000de)
  static let black87 = ColorName(rgbaValue: 0x000000de)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e0f2f6"></span>
  /// Alpha: 100% <br/> (0xe0f2f6ff)
  static let lightBlueGrey = ColorName(rgbaValue: 0xe0f2f6ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#11688c"></span>
  /// Alpha: 100% <br/> (0x11688cff)
  static let lightNavy = ColorName(rgbaValue: 0x11688cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#064a6b"></span>
  /// Alpha: 100% <br/> (0x064a6bff)
  static let twilightBlue = ColorName(rgbaValue: 0x064a6bff)
}
// swiftlint:enable identifier_name line_length type_body_length

extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
