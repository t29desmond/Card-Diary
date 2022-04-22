//
//  MainCollectionViewCell.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/28.

import UIKit

protocol MainCollectionViewCellDelegate: AnyObject {
  func mainCollectionViewCellDidTouchButton(_ cell: MainCollectionViewCell)
}

class MainCollectionViewCell: UICollectionViewCell {

  weak var delegate: MainCollectionViewCellDelegate?

  @IBOutlet weak var mainCustomViewLbl: CustomView!
  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var ellipsisBtn: UIButton!

  override func awakeFromNib() {

    cardView.layer.cornerRadius = 38
    ellipsisBtn.tintColor = .white

    mainCustomViewLbl.mainMonthNum.text = "4"
    mainCustomViewLbl.mainMonthNum.font = mainCustomViewLbl.mainMonthNum.font.withSize(60)
    mainCustomViewLbl.mainMonthText.text = "Apr"
    mainCustomViewLbl.mainMonthText.font = mainCustomViewLbl.mainMonthText.font.withSize(22)
  }


  @IBAction func ellipsisBtn(_ sender: UIButton) {
    self.delegate?.mainCollectionViewCellDidTouchButton(self)
  }
}
