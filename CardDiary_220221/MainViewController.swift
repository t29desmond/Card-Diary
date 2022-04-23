//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate,
                          UICollectionViewDataSource {

  @IBOutlet weak var collectionView: UICollectionView!

  var mounthNum: [String] =  [ "1", "2", "3", "4", "5", "6",
                                "7", "8", "9","10","11", "12"]

  var mounthText: [String] =  [ "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                "Jul", "Aug", "Sep","Oct","Nov", "Dec"]

  var cardColor : [UIColor] = [ .lightGray, .lightGray, .lightGray, .lightGray, .lightGray,
                                .lightGray, .lightGray, .lightGray, .lightGray , .lightGray,
                                .lightGray, .lightGray ]

  var indexPoint: IndexPath?

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return cardColor.count

  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }

    cell.cardView.backgroundColor = cardColor[indexPath.item]
    cell.cardView.layer.cornerRadius = 38

    cell.ellipsisBtn.tintColor = .white

    cell.mainCustomViewLbl.mainMonthNum.text = mounthNum[indexPath.item]
    cell.mainCustomViewLbl.mainMonthNum.font = cell.mainCustomViewLbl.mainMonthNum.font.withSize(60)
    cell.mainCustomViewLbl.mainMonthText.text = mounthText[indexPath.item]
    cell.mainCustomViewLbl.mainMonthText.font = cell.mainCustomViewLbl.mainMonthText.font.withSize(22)


    cell.delegate = self
    print("cell item : \(indexPath.item)")

    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    collectionView.backgroundColor = .white
  }
}


extension MainViewController: HalfModalViewControllerDelegate {

  func halfmodal(_ modal: HalfModalViewController, didSelectColor color : UIColor) {

    let cell = collectionView.cellForItem(at: indexPoint!) as? MainCollectionViewCell
    cell?.cardView.backgroundColor = color
    cardColor[indexPoint!.item] = color

    print("indexPoint selected: \(indexPoint!.item)")
    modal.dismiss(animated: true, completion: nil)
  }
}


extension MainViewController: MainCollectionViewCellDelegate {
  func mainColleciontViewHistorySegueDidTouchButton(_ seguePush: MainCollectionViewCell) {
    guard let viewController = storyboard?
      .instantiateViewController(withIdentifier: "HistoryViewController")
            as? HistoryViewController else { return }
    self.navigationController?.pushViewController(viewController,
                                                  animated: true)
    print(viewController)
  }

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
