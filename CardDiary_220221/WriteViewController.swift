//
//  writeViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/04/26.
//

import UIKit

// 말하는 주체가 { 말하는 방식 }
protocol WriteViewControllerDelegate: AnyObject {
  func writeViewControllerSaveButton(_ saveButton: WriteViewController,
                                     _ saveTextFiled: HistoryCollectionViewCellProperty)
}

class WriteViewController: UIViewController, UITextFieldDelegate {
  
  weak var delegate: WriteViewControllerDelegate?

  @IBOutlet weak var saveBtn: UIButton! {
    didSet {
      saveBtn.isEnabled = false
    }

  }
  @IBOutlet weak var textFieldLabel: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.textFieldLabel.delegate = self
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
               replacementString string: String) -> Bool {
    if range.location == 0 && range.length != 0 {
          self.saveBtn.isEnabled = false
      } else {
          self.saveBtn.isEnabled = true
      }
    print("range: ", range)
    return true
  }
  
  @IBAction func textFieldSaveBtn(_ sender: UIButton) {
    let saveTextField = textFieldLabel.text
    let textFieldSave: HistoryCollectionViewCellProperty = HistoryCollectionViewCellProperty(tagtexFiled: saveTextField)
    self.delegate?.writeViewControllerSaveButton(self, textFieldSave)
    self.dismiss(animated: true, completion: nil)
    print("tab Save Button")
  }
}
