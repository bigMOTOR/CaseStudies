//
//  MainController.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import UIKit
import RxSwift

final class MainController: UIViewController {
  
  @IBOutlet weak var topColorView: UIView!
  @IBOutlet weak var someLabel: UILabel!
  @IBOutlet weak var goToSecondaryButton: UIButton!
  
  var viewModel: MainViewModel!
  var router: MainRouter!
  private let _bag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    _bag.insert {
      viewModel.keyColor.drive(topColorView.rx.backgroundColor)
      viewModel.randomNumber.drive(someLabel.rx.text)
    }
    
    goToSecondaryButton.rx.tap.asDriver()
      .withLatestFrom(viewModel.randomNumber)
      .drive(onNext: { [unowned self] in
        router.navigate(.toSecondaryScreen(passingInfo: $0))
      })
      .disposed(by: _bag)
    
  }

}

