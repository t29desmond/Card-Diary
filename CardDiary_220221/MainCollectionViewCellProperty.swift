//
//  MainCollectionViewCellProperty.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/04/27.
//

import Foundation
import UIKit

struct MainCollectionViewCellProperty {
  let monthNumber: Int
  let monthText: String
  var backgroundColor: UIColor
}
var cellProperties: [MainCollectionViewCellProperty] = [
  MainCollectionViewCellProperty(monthNumber: 1, monthText: "Jan", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 2, monthText: "Feb", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 3, monthText: "Mar", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 4, monthText: "Apr", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 5, monthText: "May", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 6, monthText: "Jun", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 7, monthText: "Jul", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 8, monthText: "Aug", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 9, monthText: "Sep", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 10, monthText: "Oct", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 11, monthText: "Nov", backgroundColor: .white),
  MainCollectionViewCellProperty(monthNumber: 12, monthText: "Dec", backgroundColor: .white)
]
