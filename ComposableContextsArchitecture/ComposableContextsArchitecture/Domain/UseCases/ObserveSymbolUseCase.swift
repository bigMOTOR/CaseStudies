//
//  ObserveSymbolUseCase.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 15.04.2021.
//

import Foundation
import RxSwift

protocol ObserveSymbolUseCase {
  var randomSymbol: Observable<String> { get }
}

extension ObserveSymbolUseCase where Self: SymbolRepositoryHolderType {
  var randomSymbol: Observable<String> {
    return symbolRepository.randomSymbol
      .distinctUntilChanged()
      .share(replay: 1)
  }
}
