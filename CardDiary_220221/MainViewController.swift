//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate,
                          UICollectionViewDataSource, SaveColorDelegate, CellDelegate {

  func selectedColor(mainCardColor: UIColor) {

    let indexPath = IndexPath(item: 0, section: 0)
//    let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell
//    cell?.cardView.backgroundColor = mainCardColor
//    cardColor[indexPath.item] = mainCardColor

    if indexPath == IndexPath(item: 0, section: 0) {
      let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell
      cell?.cardView.backgroundColor = mainCardColor
      cardColor[indexPath.item] = mainCardColor

    } else if indexPath == IndexPath(item: 1, section: 0) {
      let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell
      cell?.cardView.backgroundColor = mainCardColor
      cardColor[indexPath.item] = mainCardColor

    } else if indexPath == IndexPath(item: 2, section: 0) {
      let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell
      cell?.cardView.backgroundColor = mainCardColor
      cardColor[indexPath.item] = mainCardColor
    }
  }

//  func selectedColor(mainCardColor: UIColor) {
//    let indexPath = IndexPath(item: 0, section: 0)
//    let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell
//    cell?.cardView.backgroundColor = mainCardColor
//    cardColor[indexPath.item] = mainCardColor
//  }


  func cellDelegate() {
    guard let viewController = storyboard?.instantiateViewController(withIdentifier: "HalfModalViewController") as? HalfModalViewController else { return }
    viewController.deleagte = self
    self.present(viewController, animated: true, completion: nil)
  }

  @IBOutlet weak var collectionView: UICollectionView!
  var cardColor : [UIColor] = [ .lightGray, .lightGray, .lightGray, .lightGray, .lightGray ,
                                .lightGray , .lightGray , .lightGray , .lightGray ,
                                .lightGray , .lightGray , .lightGray ]

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return cardColor.count
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }


//    cell.cellitemNum = indexPath.item
//    cell.ellipsisNum = indexPath.item

    cell.cardView.backgroundColor = cardColor[indexPath.item]
    cell.layer.cornerRadius = 38

    cell.delegate = self
    print("Cell item : \(indexPath.item)")

    return cell
  }


  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
