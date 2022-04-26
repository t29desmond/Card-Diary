//
//  ViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/02/21.
//

import UIKit


struct HistoryCollectionViewCellProperty {
  let tagText: String
  var backgroundColor: UIColor
}

class HistoryViewController: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource {

  @IBOutlet weak var collectionView: UICollectionView!

  var cellProperties: [HistoryCollectionViewCellProperty] = [
  ]

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return cellProperties.count
  }


  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath) as?
            HitstoryCollectionViewCell else { return HitstoryCollectionViewCell() }

    let property = cellProperties[indexPath.item]
    cell.setProperty(property)

    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    collectionView.backgroundColor = .white
  }

  @IBAction func tagAddButton(_ sender: UIButton) {
    cellProperties.append(HistoryCollectionViewCellProperty.init(tagText: "팀장님 탈출하고싶습니다.", backgroundColor: .blue))
    print(cellProperties.count)
    collectionView.reloadData()
  }
  @IBAction func tagDiscardButton(_ sender: UIButton) {
    guard cellProperties.popLast() != nil else { return }
      print(cellProperties.count)
      collectionView.reloadData()
  }
}
