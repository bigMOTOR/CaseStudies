//
//  UIColorExtension.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import UIKit

extension UIColor {
  static var random: UIColor {
    return .init(red: .random(in: 0...1),
                 green: .random(in: 0...1),
                 blue: .random(in: 0...1),
                 alpha: 1)
  }
}
