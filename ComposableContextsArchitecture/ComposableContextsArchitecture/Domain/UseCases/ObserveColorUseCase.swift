//
//  ObserveColorUseCase.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import UIKit.UIColor
import RxSwift

protocol ObserveColorUseCase {
  var randomColor: Observable<UIColor> { get }
}

extension ObserveColorUseCase where Self: ColorRepositoryHolderType {
  var randomColor: Observable<UIColor> {
    return colorRepository.randomColor
      .distinctUntilChanged()
      .share(replay: 1)
  }
}
