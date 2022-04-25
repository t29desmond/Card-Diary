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

  var eeeee: [HistoryCollectionViewCellProperty] = []
  var cellProperties: [HistoryCollectionViewCellProperty] = [
    HistoryCollectionViewCellProperty(tagText: "호랑이", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "사자", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "독수리", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "고양이", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "늑대", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "거북이", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "두루미", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "침팬치", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "뱀", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "말", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "부엉이", backgroundColor: .black),
    HistoryCollectionViewCellProperty(tagText: "고슴도치", backgroundColor: .black),

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

  // 구분지어 생각하기 1.데이터 업데이트 , 2. UI업데이트
  @IBAction func tagAddButton(_ sender: UIButton) {
//        self.cellProperties.popLast()
//        self.cellProperties.append(HistoryCollectionViewCellProperty
//                                    .init(tagText: "고양이", backgroundColor: .black))
    print(cellProperties.count)
    collectionView.reloadData()

  }
}
