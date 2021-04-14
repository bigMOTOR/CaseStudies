//
//  SymbolRepositoryType.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 15.04.2021.
//

import Foundation
import RxSwift

protocol SymbolRepositoryType {
  var randomSymbol: Observable<String> { get }
}

protocol SymbolRepositoryHolderType {
  var symbolRepository: SymbolRepositoryType { get }
}
