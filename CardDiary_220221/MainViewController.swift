//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate,
                          UICollectionViewDataSource {

  @IBOutlet weak var collectionView: UICollectionView!

  var indexPoint: IndexPath?

  var cardColor : [UIColor] = [ .lightGray, .lightGray, .lightGray, .lightGray, .lightGray ,
                                .lightGray , .lightGray , .lightGray , .lightGray ,
                                .lightGray , .lightGray , .lightGray ]

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return cardColor.count // 반환되는 요소는 cardColor.count -> count 프로퍼티는 총 갯수를 알려줌

  }
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }

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


extension MainViewController: HalfModalViewControllerDelegate {
  //2. 선택된 셀을 전달해주면 될 것같은데? -> 선택된 셀을 어떻게 전달해 줄 건데? -> indexPoint = seleteditem
  func halfmodal(_ modal: HalfModalViewController, didSelectColor color : UIColor) {

    print("indexPoint selected: \(indexPoint!.item)")

//    let indexPath = IndexPath(item: 0, section: 0)
    let cell = collectionView.cellForItem(at: indexPoint!) as? MainCollectionViewCell
    cell?.cardView.backgroundColor = color
    cardColor[indexPoint!.item] = color

    modal.dismiss(animated: true, completion: nil)
  }
}


extension MainViewController: MainCollectionViewCellDelegate {
  // 1. indexPath(for:)를 통해 몇 번 째 셀이 선택 되었는지 알아 냄
  func mainCollectionViewCellDidTouchButton(_ cell: MainCollectionViewCell) {

    let seleteditem = self.collectionView.indexPath(for: cell)
    indexPoint = seleteditem
    print("item selected: \(seleteditem!.item)")

    guard let viewController = storyboard?
            .instantiateViewController(withIdentifier: "HalfModalViewController")
            as? HalfModalViewController else { return }

    viewController.deleagte = self

    self.present(viewController, animated: true, completion: nil)
  }
}
