//
//  writeViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/04/26.
//

import UIKit

// 말하는 주체가 { 말하는 방식 }
protocol WriteViewControllerDelegate: AnyObject {
  func writeViewControllerSaveButton(_ writeSave: WriteViewController,_ saveTextFiled: HistoryCollectionViewCellProperty)
}

class WriteViewController: UIViewController {
  
  weak var delegate: WriteViewControllerDelegate?
  @IBOutlet weak var textFieldLabel: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func textFieldSaveBtn(_ sender: UIButton) {
    guard let saveTextField = textFieldLabel.text else { return }
    let textFieldSave: HistoryCollectionViewCellProperty = HistoryCollectionViewCellProperty(tagtexFiled: saveTextField)
    self.delegate?.writeViewControllerSaveButton(self, textFieldSave)
  }
}
