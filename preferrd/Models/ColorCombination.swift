//
//  ColorCombination.swift
//  preferrd
//
//  Created by Christianto Budisaputra on 08/06/21.

/*
 Credit(s):
 - Computing Color Combination: https://stackoverflow.com/a/37060495/13449416
 - Generate Extra Combination: https://github.com/bennyguitar/Colours/blob/master/Colours.swift
 */

import Foundation
import UIKit

struct ColorCombination {
  let baseColor: UIColor

  init(baseColor: String) {
    self.baseColor = UIColor(hex: baseColor)
  }

  var analogous: [UIColor] {
    return [
      baseColor.offset(hue: -1 / 12),
      baseColor.offset(hue: -0.5 / 12),
      baseColor,
      baseColor.offset(hue: 0.5 / 12),
      baseColor.offset(hue: 1 / 12)
    ]
  }

  var monochromatic: [UIColor] {
    return [
      baseColor,
      baseColor.multiply(brightness: 4 / 5),
      baseColor.multiply(brightness: 0.5),
      baseColor.multiply(saturation: 0.5, brightness: 1 / 3),
      baseColor.multiply(saturation: 1 / 3, brightness: 2 / 3)
    ]
  }

  var complementary: [UIColor] {
    return [
      baseColor.multiply(brightness: 4 / 5),
      baseColor.multiply(saturation: 5 / 7),
      baseColor,
      baseColor.offset(hue: 0.5),
      baseColor.offset(hue: 0.5).multiply(saturation: 5 / 7)
    ]
  }

  var splitComplementary: [UIColor] {
    return [
      baseColor.offset(hue: 150 / 360, saturation: -0.3, brightness: -0.05),
      baseColor.offset(hue: 150 / 360),
      baseColor,
      baseColor.offset(hue: 210 / 360),
      baseColor.offset(hue: 210 / 360, saturation: -0.3, brightness: -0.05)
    ]
  }

  var triadic: [UIColor] {
    return [
      baseColor.offset(hue: 120 / 360, brightness: -0.05).multiply(saturation: 2 / 3),
      baseColor.offset(hue: 120 / 360),
      baseColor,
      baseColor.offset(hue: 240 / 360),
      baseColor.offset(hue: 240 / 360, brightness: -0.05).multiply(saturation: 2 / 3)
    ]
  }
}

extension UIColor {
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
