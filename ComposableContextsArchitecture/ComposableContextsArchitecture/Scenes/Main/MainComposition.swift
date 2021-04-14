//
//  MainComposition.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation
import Dip

enum MainComposition {
  static func configure(_ container: DependencyContainer) {
    
    // UseCases
    container.register {
      MainContext(colorRepository: $0, numberRepository: $1)
    }
    .implements(MainViewModel.UseCases.self)
    
    // View Models
    container.register {
      MainViewModel(useCases: $0)
    }
    
    // View Controller
    container
      .register(storyboardType: MainController.self, tag: "Main")
      .resolvingProperties { container, controller in
        controller.viewModel = try container.resolve()
        controller.router = MainRouter(container: container, controller: controller)
      }
    
    DependencyContainer.uiContainers.append(container)
  }
}

extension MainController: StoryboardInstantiatable {}

// MARK: Context
private final class MainContext: ColorRepositoryHolderType, NumberRepositoryHolderType {
  let colorRepository: ColorRepositoryType
  let numberRepository: NumberRepositoryType

  init(colorRepository: ColorRepositoryType, numberRepository: NumberRepositoryType) {
    self.colorRepository = colorRepository
    self.numberRepository = numberRepository
  }
}

extension MainContext: ObserveColorUseCase {}
extension MainContext: ObserveNumberUseCase {}
