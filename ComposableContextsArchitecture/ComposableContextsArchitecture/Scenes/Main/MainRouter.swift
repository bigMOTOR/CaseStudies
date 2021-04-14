//
//  MainRouter.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import Foundation

final class MainRouter: BaseRouter, Router {
  
  enum Segue {
    case toSecondaryScreen(passingInfo: String)
  }
  
  func navigate(_ segue: Segue) {
    switch segue {
    case .toSecondaryScreen(let passingInfo):
      container.register { passingInfo }
      controller.performSegue(withIdentifier: segue.storyboardIdentifier, sender: nil)
    }
  }
}

extension MainRouter.Segue: StoryboardIdentifiable {
  var storyboardIdentifier: String {
    switch self {
    case .toSecondaryScreen:
      return "toSecondary"
    }
  }
}
