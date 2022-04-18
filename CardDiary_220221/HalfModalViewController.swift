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
  @IBOutlet var colorButtons: [UIButton]!

  weak var deleagte: SaveColorDelegate?

  var clickBtn: UIColor = .black

  var sheetPresentatioinController: UISheetPresentationController {
    presentationController as! UISheetPresentationController
  }

  private var colors: [UIColor] = [ .red,
                                    .orange,
                                    .green,
                                    .blue,
                                    .systemPink,
                                    .yellow,
                                    .cyan,
                                    .purple,
                                    .brown,
                                    .black,
                                    .magenta,
                                    .lightGray ]

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .darkGray
    colorLb.text = "Color"
    colorLb.textColor = .white
    colorLb.font = .systemFont(ofSize: 20)

    colorButtons.enumerated().forEach { (offset: Int, button: UIButton) in
      settingColorAndCycle(button: button, color: colors[offset])
    }

    // Half Modal
    sheetPresentatioinController.delegate = self
    sheetPresentatioinController.selectedDetentIdentifier = .medium
    sheetPresentatioinController.prefersGrabberVisible = true
    sheetPresentatioinController.detents = [ .medium() ]
  }

  @IBAction func tapColorBtn(_ sender: UIButton) {
    if sender == colorButtons[0] {
      self.colorButtons[0].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[0].tintColor = .white
      self.colorButtons[0].layer.borderWidth = 2
      self.colorButtons[0].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .red

    } else if sender == colorButtons[1] {
      self.colorButtons[1].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[1].tintColor = .white
      self.colorButtons[1].layer.borderWidth = 2
      self.colorButtons[1].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .orange

    } else if sender == colorButtons[2] {
      self.colorButtons[2].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[2].tintColor = .black
      self.colorButtons[2].layer.borderWidth = 2
      self.colorButtons[2].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .green

    } else if sender == colorButtons[3] {
      self.colorButtons[3].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[3].tintColor = .white
      self.colorButtons[3].layer.borderWidth = 2
      self.colorButtons[3].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .blue

    } else if sender == colorButtons[4] {
      self.colorButtons[4].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[4].tintColor = .white
      self.colorButtons[4].layer.borderWidth = 2
      self.colorButtons[4].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .systemPink

    } else if sender == colorButtons[5] {
      self.colorButtons[5].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[5].tintColor = .black
      self.colorButtons[5].layer.borderWidth = 2
      self.colorButtons[5].layer.borderColor = UIColor.black.cgColor
      self.clickBtn = .yellow

    } else if sender == colorButtons[6] {
      self.colorButtons[6].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[6].tintColor = .black
      self.colorButtons[6].layer.borderWidth = 2
      self.colorButtons[6].layer.borderColor = UIColor.black.cgColor
      self.clickBtn = .cyan

    } else if sender == colorButtons[7] {
      self.colorButtons[7].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[7].tintColor = .white
      self.colorButtons[7].layer.borderWidth = 2
      self.colorButtons[7].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .purple

    } else if sender == colorButtons[8] {
      self.colorButtons[8].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[8].tintColor = .white
      self.colorButtons[8].layer.borderWidth = 2
      self.colorButtons[8].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .brown

    } else if sender == colorButtons[9] {
      self.colorButtons[9].setImage(UIImage(systemName: "checkmark"),
                                    for: .normal)
      self.colorButtons[9].tintColor = .white
      self.colorButtons[9].layer.borderWidth = 2
      self.colorButtons[9].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .black

    } else if sender == colorButtons[10] {
      colorButtons[10].setImage(UIImage(systemName: "checkmark"),
                                for: .normal)
      self.colorButtons[10].tintColor = .white
      self.colorButtons[10].layer.borderWidth = 2
      self.colorButtons[10].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .magenta

    } else if sender == colorButtons[11] {
      self.colorButtons[11].setImage(UIImage(systemName: "checkmark"),
                                     for: .normal)
      self.colorButtons[11].tintColor = .white
      self.colorButtons[1].layer.borderWidth = 2
      self.colorButtons[11].layer.borderColor = UIColor.white.cgColor
      self.clickBtn = .lightGray
    }

    self.deleagte?.selectedColor(mainCardColor: self.clickBtn)
    self.dismiss(animated: true, completion: nil)

  }

  private func settingColorAndCycle(button: UIButton, color: UIColor) {
    button.layer.cornerRadius = button.bounds.width * 0.5
    button.backgroundColor = color
  }

}

