//
//  MainCollectionViewCell.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/28.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, SaveColorDelegate {
  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var ellipsisBtn: UIButton!
  @IBOutlet weak var mainCustomViewLbl: CustomView!
  

  func selectedColor(mainCardColor: UIColor) {
    self.cardView.backgroundColor = mainCardColor
  }

  // awakeFormNib() -> ??
  override func awakeFromNib() {
    self.backgroundColor = .darkGray
    self.contentView.backgroundColor = .darkGray

    cardView.backgroundColor = .blue
    ellipsisBtn.tintColor = .white
    cardView.layer.cornerRadius = 32

    mainCustomViewLbl.mainMonthNum.text = "3"
    mainCustomViewLbl.mainMonthNum.font = mainCustomViewLbl.mainMonthNum.font.withSize(50)
    mainCustomViewLbl.mainMonthText.text = "MAR"
    mainCustomViewLbl.mainMonthText.font = mainCustomViewLbl.mainMonthText.font.withSize(22)
  }
  
}
