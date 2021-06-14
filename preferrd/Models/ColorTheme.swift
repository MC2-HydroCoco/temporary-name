//
//  ColorMeanings.swift
//  preferrd
//
//  Created by Christianto Budisaputra on 07/06/21.
//

import Foundation
import UIKit

enum ColorTheme: String {
  case relaxing     = "Relaxing",
       vintage      = "Vintage",
       happy        = "Happy",
       adventurous  = "Adventurous",
       modern       = "Modern",
       nature       = "Nature",
       fresh        = "Fresh",
       elegant      = "Elegant",
       feminine     = "Feminine",
       masculine    = "Masculine"

  static func getRelatedColors(for meaning: ColorTheme) -> [Color] {
    return Constants.colors.filter { $0.relatedTags.contains(meaning) }
  }
}