//
//  RxSwiftExtension.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 15.04.2021.
//

import RxSwift
import RxCocoa

extension ObservableType {
  func mapToVoid() -> Observable<Void> {
    return self.map { _ in }
  }
}
