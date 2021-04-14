//
//  ObserveNumberUseCase.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import RxSwift

protocol ObserveNumberUseCase {
  var randomDouble: Observable<Double> { get }
}

extension ObserveNumberUseCase where Self: NumberRepositoryHolderType {
  var randomDouble: Observable<Double> {
    return numberRepository.randomInt
      .map(Double.init)
      .map { $0 / 2.9 }
      .distinctUntilChanged()
      .share(replay: 1)
  }
}
