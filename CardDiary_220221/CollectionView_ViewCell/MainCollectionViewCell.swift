//
//  MainCollectionViewCell.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/28.

import UIKit

protocol MainCollectionViewCellDelegate: AnyObject {
  func mainCollectionViewCellDidTouchButton(_ cell: MainCollectionViewCell)
  func mainColleciontViewHistorySegueDidTouchButton(_ seguePush: MainCollectionViewCell)
}

class MainCollectionViewCell: UICollectionViewCell {

  weak var delegate: MainCollectionViewCellDelegate?


  @IBOutlet weak var mainCustomViewLbl: CustomView!
  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var ellipsisBtn: UIButton!

  override func awakeFromNib() {
  }

  @IBAction func ellipsisBtn(_ sender: UIButton) {
    self.delegate?.mainCollectionViewCellDidTouchButton(self)
  }

  @IBAction func historySegue(_ sender: UIButton) {
    self.delegate?.mainColleciontViewHistorySegueDidTouchButton(self)
  }


}

