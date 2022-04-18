//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.
//

import UIKit

/*
 선택한 셀의 배경색을 변경한다.

 (1) 선택한 셀의
 a. 선택한 셀이 몇 번째 셀 인지 알기
 b. 선택한 셀의 배경색을
 (2) 배경색을 변경한다.
 a.HalfModalVC를 MainVC에 전달한다.
 b.
 */

class MainViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          SaveColorDelegate {


  func selectedColor(mainCardColor: UIColor) {
  }

  @IBOutlet weak var collectionView: UICollectionView!

  var cardColor : [UIColor] = [.red, .red, .red, .red, .red, .red, .red, .red, .red, .red, .red, .red]
  var selectedCell: Int?


  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int)-> Int {
    return cardColor.count
  }


  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }

    cell.backgroundColor = cardColor[indexPath.item] // 셀 색상 지정
    print("cell : \(indexPath.item)") // view에 보이는 cell의 순서


    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }


  @IBAction func ellipsisBtn(_ sender: UIButton) {
    guard let viewController = storyboard?
            .instantiateViewController(withIdentifier: "HalfModalViewController")
            as? HalfModalViewController else { return }
    viewController.deleagte = self
    present(viewController, animated: true, completion: nil)
  }
}




