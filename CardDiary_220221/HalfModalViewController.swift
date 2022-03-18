//
//  halfModalViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/14.
//

import UIKit

protocol SaveColorDelegate : AnyObject {
  func selectedColor(mainCardColor : UIColor)
}

class HalfModalViewController: UIViewController, UISheetPresentationControllerDelegate {

  @IBOutlet weak var colorLb: UILabel!

  // color palette - 1
  @IBOutlet weak var firstLineColorOne: UIButton!
  @IBOutlet weak var firstLineColorTwo: UIButton!
  @IBOutlet weak var firstLineColorThree: UIButton!
  @IBOutlet weak var firstLineColorFour: UIButton!
  @IBOutlet weak var firstLineColorFive: UIButton!
  @IBOutlet weak var firstLineColorSix: UIButton!
  // color palette - 2
  @IBOutlet weak var secondLineColorOne: UIButton!
  @IBOutlet weak var secondLineColorTwo: UIButton!
  @IBOutlet weak var secondLineColorThree: UIButton!
  @IBOutlet weak var secondLineColorFour: UIButton!
  @IBOutlet weak var secondLineColorFive: UIButton!
  @IBOutlet weak var secondLineColorSix: UIButton!

  weak var deleagte: SaveColorDelegate?
  var mainCardColor: UIColor  = .black

  var sheetPresentatioinController: UISheetPresentationController {
    presentationController as! UISheetPresentationController
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    colorLb.text = "Color"
    colorLb.textColor = .white
    colorLb.font = .systemFont(ofSize: 20)

    view.backgroundColor = .darkGray

    // color & cornerRadius Setting
    settingColorandCycle(firstLineColorOne, .red)
    settingColorandCycle(firstLineColorTwo, .orange)
    settingColorandCycle(firstLineColorThree, .green)
    settingColorandCycle(firstLineColorFour, .blue)
    settingColorandCycle(firstLineColorFive, .systemPink)
    settingColorandCycle(firstLineColorSix, .yellow)
    settingColorandCycle(secondLineColorOne, .cyan)
    settingColorandCycle(secondLineColorTwo, .purple)
    settingColorandCycle(secondLineColorThree, .brown)
    settingColorandCycle(secondLineColorFour, .black)
    settingColorandCycle(secondLineColorFive, .white)
    settingColorandCycle(secondLineColorSix, .lightGray)

    // Half Modal
    sheetPresentatioinController.delegate = self
    sheetPresentatioinController.selectedDetentIdentifier = .medium
    sheetPresentatioinController.prefersGrabberVisible = true
    sheetPresentatioinController.detents = [ .medium() ]
  }

  @IBAction func tapColorBtn(_ sender: UIButton) {

    if sender == firstLineColorOne {
      self.mainCardColor = .red
    } else if sender == firstLineColorTwo {
      self.mainCardColor = .orange
    } else if sender == firstLineColorThree {
      self.mainCardColor = .green
    } else if sender == firstLineColorFour {
      self.mainCardColor = .blue
    } else if sender == firstLineColorFive {
      self.mainCardColor = .systemPink
    } else if sender == firstLineColorSix {
      self.mainCardColor = .yellow
    } else if sender == secondLineColorOne {
      self.mainCardColor = .cyan
    } else if sender == secondLineColorTwo {
      self.mainCardColor = .purple
    } else if sender == secondLineColorThree {
      self.mainCardColor = .brown
    } else if sender == secondLineColorFour {
      self.mainCardColor = .black
    } else if sender == secondLineColorFive {
      self.mainCardColor = .white
    } else {
      self.mainCardColor = .lightGray
    }

    self.deleagte?.selectedColor(mainCardColor: self.mainCardColor)
    self.dismiss(animated: true, completion: nil)

  }

  // color & cornerRadius Setting Method
  private func settingColorandCycle(_ btnLabel: UIButton, _ chagneColor: UIColor) {
    btnLabel.layer.cornerRadius = btnLabel.bounds.width * 0.5
    btnLabel.backgroundColor = chagneColor
  }
}

