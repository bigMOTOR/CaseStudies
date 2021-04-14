//
//  NumberRepositoryType.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import RxSwift

protocol NumberRepositoryType {
  var randomInt: Observable<Int> { get }
}

protocol NumberRepositoryHolderType {
  var numberRepository: NumberRepositoryType { get }
}
