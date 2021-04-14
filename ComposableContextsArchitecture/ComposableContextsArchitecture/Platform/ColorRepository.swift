//
//  ColorRepository.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import UIKit.UIColor
import RxSwift

final class ColorRepository: ColorRepositoryType {
  let randomColor: Observable<UIColor>
  
  init(changeColorSeconds: Int) {
    self.randomColor = Observable<Int>.interval(.seconds(changeColorSeconds), scheduler: MainScheduler.instance)
      .startWith(0)
      .map { _ in UIColor.random }
      .share(replay: 1)
  }
  
}
