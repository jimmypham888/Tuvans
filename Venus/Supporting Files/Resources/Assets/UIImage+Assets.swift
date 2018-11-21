// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias AssetImageTypeAlias = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let account = ImageAsset(name: "account")
  internal static let email = ImageAsset(name: "email")
  internal static let message = ImageAsset(name: "message")
  internal static let smartphone = ImageAsset(name: "smartphone")
  internal static let linkedin = ImageAsset(name: "Linkedin")
  internal static let cuongdo = ImageAsset(name: "cuongdo")
  internal static let ducnguyen = ImageAsset(name: "ducnguyen")
  internal static let ducnhu = ImageAsset(name: "ducnhu")
  internal static let giangle = ImageAsset(name: "giangle")
  internal static let khanhnguyen = ImageAsset(name: "khanhnguyen")
  internal static let longnguyen = ImageAsset(name: "longnguyen")
  internal static let ngogiatu = ImageAsset(name: "ngogiatu")
  internal static let nhatbui = ImageAsset(name: "nhatbui")
  internal static let phuongtran2 = ImageAsset(name: "phuongtran-2")
  internal static let phuongtran = ImageAsset(name: "phuongtran")
  internal static let thangdao = ImageAsset(name: "thangdao")
  internal static let trungdo = ImageAsset(name: "trungdo")
  internal static let schedule = ImageAsset(name: "schedule")
  internal static let account24 = ImageAsset(name: "account24")
  internal static let addBlack = ImageAsset(name: "add_black")
  internal static let back = ImageAsset(name: "back")
  internal static let close = ImageAsset(name: "close")
  internal static let eye36 = ImageAsset(name: "eye36")
  internal static let flogo = ImageAsset(name: "flogo")
  internal static let googleLogo = ImageAsset(name: "googleLogo")
  internal static let iTunesArtwork = ImageAsset(name: "iTunesArtwork")
  internal static let key = ImageAsset(name: "key")
  internal static let search = ImageAsset(name: "search")
  internal static let searchTabBar = ImageAsset(name: "searchTabBar")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

internal extension AssetColorTypeAlias {
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

internal struct DataAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(OSX)
  @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
  internal var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
internal extension NSDataAsset {
  convenience init!(asset: DataAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(OSX)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: AssetImageTypeAlias {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = AssetImageTypeAlias(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal extension AssetImageTypeAlias {
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

private final class BundleToken {}
