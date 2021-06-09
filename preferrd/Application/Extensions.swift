//
//  Extensions.swift
//  preferrd
//
//  Created by Christianto Budisaputra on 29/05/21.
//

import Foundation
import UIKit

extension String {
  // Call on any string and it'll return a translated string, if any.
  /// ex: let hello = "Hello World".localized
  /// if any translation for "Hello World" is specified,
  /// then, based on the device's language, you'll get the translated string.
  var localized: String {
    NSLocalizedString(self, comment: "")
  }
}

extension UIColor {
  convenience init(hex: String, alpha: CGFloat = 1.0) {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if cString.hasPrefix("#") {
      cString.remove(at: cString.startIndex)
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    self.init(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: alpha
    )
  }

  func offset(hue hOffset: CGFloat = 0, saturation sOffset: CGFloat = 0, brightness bOffset: CGFloat = 0) -> UIColor {

    var hue: CGFloat         = 0
    var saturation: CGFloat  = 0
    var brightness: CGFloat  = 0
    var alpha: CGFloat       = 0

    getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

    return UIColor(hue: fmod(hue + hOffset, 1),
                   saturation: saturation + sOffset,
                   brightness: brightness + bOffset,
                   alpha: alpha)
  }

  func multiply(hue hMultiplier: CGFloat = 1,
                saturation sMultiplier: CGFloat = 1,
                brightness bMultiplier: CGFloat = 1,
                alpha aMultiplier: CGFloat = 1) -> UIColor {

    var hue: CGFloat         = 0
    var saturation: CGFloat  = 0
    var brightness: CGFloat  = 0
    var alpha: CGFloat       = 0

    getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

    return UIColor(hue: hue * hMultiplier,
                   saturation: saturation * sMultiplier,
                   brightness: brightness * bMultiplier,
                   alpha: alpha * aMultiplier)
  }
}
