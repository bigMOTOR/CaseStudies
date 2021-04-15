//
//  SecondaryViewModel.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import UIKit.UIColor
import RxSwift
import RxCocoa

struct SecondaryViewModel {
  typealias UseCases = ObserveColorUseCase & ObserveSymbolUseCase
  
  let keyColor: Driver<UIColor>
  let info: Driver<String>
  
  init(useCases: UseCases, infoFromMain: String) {
    self.keyColor = useCases.randomColor
      .distinctUntilChanged()
      .asDriver(onErrorDriveWith: .empty())
    
    self.info = useCases.randomSymbol
      .map { "\($0): \(infoFromMain)" }
      .distinctUntilChanged()
      .asDriver(onErrorDriveWith: .empty())
  }
}
