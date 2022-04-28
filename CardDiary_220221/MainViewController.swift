//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.
//

import UIKit

class MainViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource {

  @IBOutlet weak var collectionView: UICollectionView!

  var indexPoint: IndexPath?

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return cellProperties.count
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }

    let property = cellProperties[indexPath.item]
    cell.delegate = self
    cell.setProperty(property)
//    print("cell item : \(indexPath.item)")
    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray6
    collectionView.backgroundColor = .systemGray6
  }
}


extension MainViewController: MainCollectionViewCellDelegate {


  func mainCollectionViewCellDidTouchButton(_ cell: MainCollectionViewCell) {

    guard let seleteditem = self.collectionView.indexPath(for: cell) else { return }
    indexPoint = seleteditem
    print("item selected(Half modal): \(seleteditem.item)")

    guard let viewController = storyboard?
            .instantiateViewController(withIdentifier: "HalfModalViewController")
            as? HalfModalViewController else { return }
    viewController.deleagte = self
    self.present(viewController, animated: true, completion: nil)
  }

// 셀이 무엇인지 알게 해주는 메서드
  func mainColleciontViewHistorySegueDidTouchButton(_ seguePush: MainCollectionViewCell) {

    guard let sletedsegue = self.collectionView.indexPath(for: seguePush) else { return }
    print("selected segue (History): \(sletedsegue.item)")

    guard let viewController = storyboard?
            .instantiateViewController(withIdentifier: "HistoryViewController")
            as? HistoryViewController else { return }
    //    viewController.delegate = self // 어떤걸 받을 건지
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}


extension MainViewController: HalfModalViewControllerDelegate {

  func halfmodal(_ modal: HalfModalViewController, didSelectColor color : UIColor) {
    guard let cell = collectionView.cellForItem(at: indexPoint!)
            as? MainCollectionViewCell else { return }

    cell.cardView.backgroundColor = color
    cellProperties[indexPoint!.item].backgroundColor = color

    print("indexPoint selected(cell point): \(indexPoint!.item)")
    modal.dismiss(animated: true, completion: nil)
  }
}


