//
//  ViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/02/21.
//

import UIKit

class HistoryViewController: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var tagColor : [UIColor] = [ .lightGray, .lightGray, .lightGray, .lightGray ]

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return tagColor.count
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath) as?
            HitstoryCollectionViewCell else { return HitstoryCollectionViewCell() }

    cell.tagView.backgroundColor = tagColor[indexPath.item]
    cell.tagView.layer.cornerRadius = 18

    return cell

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    collectionView.backgroundColor = .white
  }

}
