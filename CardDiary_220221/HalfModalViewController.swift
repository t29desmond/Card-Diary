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

  var clickBtn: UIColor = .green

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .darkGray
    colorLb.text = "Color"
    colorLb.textColor = .white
    colorLb.font = .systemFont(ofSize: 20)

    // enumerated(): array값에 enumerated()함수를 사용 -> (index, value) 튜플 형식으로 구현된 리스트형이 리턴
    // forEach : 반복 실행하려는 코드를 파라미터로 받고, 저장된 요소는 클로저 상수로 전달
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
      colorButtons[0].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[0].tintColor = .white
      colorButtons[0].layer.borderWidth = 2
      colorButtons[0].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[1] {
      colorButtons[1].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[1].tintColor = .white
      colorButtons[1].layer.borderWidth = 2
      colorButtons[1].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[2] {
      colorButtons[2].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[2].tintColor = .black
      colorButtons[2].layer.borderWidth = 2
      colorButtons[2].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[3] {
      colorButtons[3].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[3].tintColor = .white
      colorButtons[3].layer.borderWidth = 2
      colorButtons[3].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[4] {
      colorButtons[4].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[4].tintColor = .white
      colorButtons[4].layer.borderWidth = 2
      colorButtons[4].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[5] {
      colorButtons[5].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[5].tintColor = .black
      colorButtons[5].layer.borderWidth = 2
      colorButtons[5].layer.borderColor = UIColor.black.cgColor
    } else if sender == colorButtons[6] {
      colorButtons[6].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[6].tintColor = .black
      colorButtons[6].layer.borderWidth = 2
      colorButtons[6].layer.borderColor = UIColor.black.cgColor
    } else if sender == colorButtons[7] {
      colorButtons[7].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[7].tintColor = .white
      colorButtons[7].layer.borderWidth = 2
      colorButtons[7].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[8] {
      colorButtons[8].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[8].tintColor = .white
      colorButtons[8].layer.borderWidth = 2
      colorButtons[8].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[9] {
      colorButtons[9].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[9].tintColor = .white
      colorButtons[9].layer.borderWidth = 2
      colorButtons[9].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[10] {
      colorButtons[10].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[10].tintColor = .white
      colorButtons[10].layer.borderWidth = 2
      colorButtons[10].layer.borderColor = UIColor.white.cgColor
    } else if sender == colorButtons[11] {
      colorButtons[11].setImage(UIImage(systemName: "checkmark"),
                               for: .normal)
      colorButtons[11].tintColor = .white
      colorButtons[1].layer.borderWidth = 2
      colorButtons[11].layer.borderColor = UIColor.white.cgColor
    }

    guard let backgroundColor = sender.backgroundColor else { return }
    deleagte?.selectedColor(mainCardColor: backgroundColor)
    dismiss(animated: true, completion: nil)
   }

  private func settingColorAndCycle(button: UIButton, color: UIColor) {
   button.layer.cornerRadius = button.bounds.width * 0.5
   button.backgroundColor = color
  }

}

