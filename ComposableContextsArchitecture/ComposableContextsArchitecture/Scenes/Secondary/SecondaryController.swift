//
//  SecondaryController.swift
//  ComposableContextsArchitecture
//
//  Created by Nikolay Fiantsev on 14.04.2021.
//

import UIKit
import RxSwift

final class SecondaryController: UIViewController {
  
  @IBOutlet weak var colorCircle: UIView!
  @IBOutlet weak var someLabel: UILabel!
  
  var viewModel: SecondaryViewModel!
  private let _bag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.keyColor
      .drive(colorCircle.rx.backgroundColor)
      .disposed(by: _bag)
    
    viewModel.info
      .drive(someLabel.rx.text)
      .disposed(by: _bag)
  }

}
