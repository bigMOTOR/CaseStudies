//
//  NumberRepository.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import RxSwift

final class NumberRepository: NumberRepositoryType {
  let randomInt: Observable<Int>
  
  init() {
    self.randomInt = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
      .startWith(0)
      .map { _ in .random(in: 0...999) }
  }
  
}
