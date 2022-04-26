//
//  writeViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/04/26.
//

import UIKit

// 말하는 주체가 { 말하는 방식 }
protocol WriteViewControllerDelegate: AnyObject {
  func writeViewControllerSaveButton(_ save: HistoryCollectionViewCellProperty)
}

class WriteViewController: UIViewController {
  
  weak var delegate: WriteViewControllerDelegate?
  @IBOutlet weak var textFieldLabel: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func textFieldSaveBtn(_ sender: UIButton) {
    guard let textField = textFieldLabel.text else { return }
    let texttag: HistoryCollectionViewCellProperty = HistoryCollectionViewCellProperty(tagtexFiled: textField)
    self.delegate?.writeViewControllerSaveButton(texttag)
    self.dismiss(animated: true, completion: nil)
  }
}
