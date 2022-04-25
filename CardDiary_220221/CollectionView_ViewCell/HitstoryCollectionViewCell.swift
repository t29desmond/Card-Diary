//
//  CellUICollectionViewCell.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.
//

import UIKit

class HitstoryCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var tagView: UIView!
  @IBOutlet weak var tagText: UILabel!
  @IBOutlet weak var historyCustomViewLbl: CustomView!

  override func awakeFromNib() {
  }

  func setProperty(_ property: HistoryCollectionViewCellProperty) {
    self.tagText.text = "\(property.tagText)"
    self.tagView.backgroundColor = property.backgroundColor
    self.tagView.layer.cornerRadius = 18
  }
}

