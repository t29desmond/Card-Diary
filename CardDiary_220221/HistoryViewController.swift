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

  //  var blank: [HistoryCollectionViewCellProperty] = []

  var index = 0
  var cellProperties: [HistoryCollectionViewCellProperty] = [
    HistoryCollectionViewCellProperty(tagText: "빨간 호랑이", backgroundColor: .red),
    HistoryCollectionViewCellProperty(tagText: "주황 사자", backgroundColor: .orange),
    HistoryCollectionViewCellProperty(tagText: "노란 독수리", backgroundColor: .yellow),
    HistoryCollectionViewCellProperty(tagText: "초록 고양이", backgroundColor: .green),
    HistoryCollectionViewCellProperty(tagText: "파란 늑대", backgroundColor: .blue)
  ]


  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return index
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
    index = index + 1
    if index == 6 {
      index = 0
      print(index)
    }
    collectionView.reloadData()
  }

  @IBAction func tagDiscardButton(_ sender: UIButton) {
    index = index - 1
    if index == -1 {
      index = 0
      print(index)
    }
    collectionView.reloadData()
  }
}
