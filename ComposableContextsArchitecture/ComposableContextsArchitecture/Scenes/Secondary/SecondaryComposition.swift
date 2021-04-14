//
//  SecondaryComposition.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import Dip

enum SecondaryComposition {
  static func configure(_ container: DependencyContainer) {
    
    // UseCases
    container.register {
      SecondaryContext(colorRepository: $0)
    }
    .implements(SecondaryViewModel.UseCases.self)
    
    // View Models
    container.register {
      SecondaryViewModel(useCases: $0, infoFromMain: $1)
    }
    
    // View Controller
    container
      .register(storyboardType: SecondaryController.self, tag: "Secondary")
      .resolvingProperties { container, controller in
        controller.viewModel = try container.resolve()
      }
    
    DependencyContainer.uiContainers.append(container)
  }
}

extension SecondaryController: StoryboardInstantiatable {}

// MARK: Context
private final class SecondaryContext: ColorRepositoryHolderType {
  let colorRepository: ColorRepositoryType

  init(colorRepository: ColorRepositoryType) {
    self.colorRepository = colorRepository
  }
}

extension SecondaryContext: ObserveColorUseCase {}
