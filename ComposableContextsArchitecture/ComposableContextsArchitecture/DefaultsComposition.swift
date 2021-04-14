//
//  DefaultsComposition.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import Dip

/// Home of world state dependencies
enum DefaultsComposition {
  static func configure(_ container: DependencyContainer) {
    
    // ColorRepository
    container.register(.singleton) {
      ColorRepository(changeColorSeconds: 5)
    }
    .implements(ColorRepositoryType.self)
    
    // NumberRepository
    container.register(.singleton) {
      NumberRepository()
    }
    .implements(NumberRepositoryType.self)
    
    // SymbolRepository
    container.register(.singleton) {
      SymbolRepository()
    }
    .implements(SymbolRepositoryType.self)
    
  }
}
