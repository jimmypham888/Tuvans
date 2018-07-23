// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  typealias AssetColorTypeAlias = NSColor
  typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias AssetColorTypeAlias = UIColor
  typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
typealias AssetType = ImageAsset

struct ImageAsset {
  fileprivate var name: String

  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

struct ColorAsset {
  fileprivate var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
enum Asset {
  enum Booking {
    static let account = ImageAsset(name: "account")
    static let email = ImageAsset(name: "email")
    static let message = ImageAsset(name: "message")
    static let smartphone = ImageAsset(name: "smartphone")
  }
  static let linkedin = ImageAsset(name: "Linkedin")
  enum People {
    static let cuongdo = ImageAsset(name: "cuongdo")
    static let ducnguyen = ImageAsset(name: "ducnguyen")
    static let ducnhu = ImageAsset(name: "ducnhu")
    static let giangle = ImageAsset(name: "giangle")
    static let khanhnguyen = ImageAsset(name: "khanhnguyen")
    static let longnguyen = ImageAsset(name: "longnguyen")
    static let ngogiatu = ImageAsset(name: "ngogiatu")
    static let nhatbui = ImageAsset(name: "nhatbui")
    static let phuongtran2 = ImageAsset(name: "phuongtran-2")
    static let phuongtran = ImageAsset(name: "phuongtran")
    static let thangdao = ImageAsset(name: "thangdao")
    static let trungdo = ImageAsset(name: "trungdo")
  }
  static let addBlack = ImageAsset(name: "add_black")
  static let back = ImageAsset(name: "back")
  static let close = ImageAsset(name: "close")
  static let iTunesArtwork = ImageAsset(name: "iTunesArtwork")
  static let key = ImageAsset(name: "key")
  static let search = ImageAsset(name: "search")

  // swiftlint:disable trailing_comma
  static let allColors: [ColorAsset] = [
  ]
  static let allImages: [ImageAsset] = [
    Booking.account,
    Booking.email,
    Booking.message,
    Booking.smartphone,
    linkedin,
    People.cuongdo,
    People.ducnguyen,
    People.ducnhu,
    People.giangle,
    People.khanhnguyen,
    People.longnguyen,
    People.ngogiatu,
    People.nhatbui,
    People.phuongtran2,
    People.phuongtran,
    People.thangdao,
    People.trungdo,
    addBlack,
    back,
    close,
    iTunesArtwork,
    key,
    search,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
