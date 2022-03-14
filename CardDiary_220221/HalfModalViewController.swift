//
//  halfModalViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/14.
//

import UIKit

class HalfModalViewController: UIViewController, UISheetPresentationControllerDelegate {

  @IBOutlet weak var colorLb: UILabel!

  var sheetPresentatioinController: UISheetPresentationController {
    presentationController as! UISheetPresentationController
  }

  override func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = .darkGray

    colorLb.text = "Color"
    colorLb.textColor = .white
    colorLb.font = .systemFont(ofSize: 20)

    sheetPresentatioinController.delegate = self
    sheetPresentatioinController.selectedDetentIdentifier = .medium
    sheetPresentatioinController.prefersGrabberVisible = true
    sheetPresentatioinController.detents = [ .medium() ]

  }

}
