//
//  SymbolRepository.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 15.04.2021.
//

import Foundation
import RxSwift

final class SymbolRepository: SymbolRepositoryType {
  let randomSymbol: Observable<String>
  
  init() {
    self.randomSymbol = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
      .startWith(0)
      .mapToVoid()
      .compactMap(_randomSymbol)
  }
  
}

private func _randomSymbol() -> String? {
  return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    .randomElement()
    .map(String.init)
}
