//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.
//

import UIKit

class MainViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          SaveColorDelegate {
  func selectedColor(mainCardColor: UIColor) {
  }

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int)-> Int {
    return 12
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell",
                                                            for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }
    return mainCell
  }

  
//  func selectedColor(mainCardColor: UIColor) {
//    self.cardView.backgroundColor = mainCardColor
//  }

  override func viewDidLoad() {
    super.viewDidLoad()
//    cardView.backgroundColor = .red
    view.backgroundColor = .darkGray
    
//    mainCustomViewLbl.mainMonthNum.text = "16"
//    mainCustomViewLbl.mainMonthNum.font = mainCustomViewLbl.mainMonthNum.font.withSize(46)
//    mainCustomViewLbl.mainMonthText.text = "MON"
//    mainCustomViewLbl.mainMonthText.font = mainCustomViewLbl.mainMonthText.font.withSize(20)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let HalfModalViewController = segue.destination as? HalfModalViewController {
      HalfModalViewController.deleagte = self
    }
  }
  
  
}

