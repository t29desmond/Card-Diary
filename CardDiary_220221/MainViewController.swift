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
    let indexPath = IndexPath(item: 0, section: 0)
    let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell
    cell?.cardView.backgroundColor = mainCardColor
    cardColor[indexPath.item] = mainCardColor
  }

  @IBOutlet weak var collectionView: UICollectionView!

  var cardColor : [UIColor] = [.blue, .green, .brown, .cyan, .darkGray, .red,
                               .magenta, .orange, .black, .gray, .white, .purple]

  var ellipsisList: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return cardColor.count
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }

    cell.cellitemNum = indexPath.item
    cell.layer.cornerRadius = 38

    cell.cardView.backgroundColor = cardColor[indexPath.item]
    cell.ellipsisBtn.tag = ellipsisList[indexPath.item]

    print("Cell item : \(indexPath.item), section : \(indexPath.section)")

    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // 1. 뷰 컨트롤러랑 직접 소통하고 있다. -> delegate 패턴
  // 2. sender의 식별자가 없다.

  @IBAction func ellipsisBtn(_ sender: UIButton) {
    guard let viewController = storyboard?
            .instantiateViewController(withIdentifier: "HalfModalViewController")
            as? HalfModalViewController else { return }
    viewController.deleagte = self
    present(viewController, animated: true, completion: nil)
  }
}




