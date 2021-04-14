//
//  RootComposition.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import Dip

enum RootComposition {
  static func configure() -> DependencyContainer {
    let container = DependencyContainer()
    
    // World state dependencies
    DefaultsComposition.configure(container)
    
    // Scenes
    MainComposition.configure(container)
    SecondaryComposition.configure(container)
    return container
  }
}
