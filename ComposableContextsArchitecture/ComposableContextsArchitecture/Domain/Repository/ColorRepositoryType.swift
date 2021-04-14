//
//  ColorRepositoryType.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import UIKit.UIColor
import RxSwift

protocol ColorRepositoryType {
  var randomColor: Observable<UIColor> { get }
}

protocol ColorRepositoryHolderType {
  var colorRepository: ColorRepositoryType { get }
}
