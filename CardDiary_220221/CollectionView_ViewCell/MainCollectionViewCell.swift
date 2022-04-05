//
//  MainCollectionViewCell.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/28.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var ellipsisBtn: UIButton!
  @IBOutlet weak var mainCustomViewLbl: CustomView!
  @IBOutlet weak var cardView: UIView!


  override func awakeFromNib() {

    self.backgroundColor = .darkGray
    self.contentView.backgroundColor = .darkGray

    cardView.backgroundColor = .black
    cardView.layer.cornerRadius = 38
    ellipsisBtn.tintColor = .white

    mainCustomViewLbl.mainMonthNum.text = "4"
    mainCustomViewLbl.mainMonthNum.font = mainCustomViewLbl.mainMonthNum.font.withSize(60)
    mainCustomViewLbl.mainMonthText.text = "Apr"
    mainCustomViewLbl.mainMonthText.font = mainCustomViewLbl.mainMonthText.font.withSize(22)
  }
}


