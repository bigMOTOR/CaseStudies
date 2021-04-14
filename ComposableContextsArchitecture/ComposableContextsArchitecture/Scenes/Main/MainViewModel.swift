//
//  MainViewModel.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import UIKit.UIColor
import RxSwift
import RxCocoa

struct MainViewModel {
  typealias UseCases = ObserveColorUseCase & ObserveNumberUseCase
  
  let keyColor: Driver<UIColor>
  let randomNumber: Driver<String>
  
  init(useCases: UseCases) {
    self.keyColor = useCases.randomColor
      .distinctUntilChanged()
      .asDriver(onErrorDriveWith: .empty())
    
    self.randomNumber = useCases.randomDouble
      .map { "\($0)" }
      .distinctUntilChanged()
      .asDriver(onErrorDriveWith: .empty())
  }
}
