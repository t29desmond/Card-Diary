//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.
//
import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate,
                          UICollectionViewDataSource, SaveColorDelegate, CellDelegate {

  func cellDelegate() {
    guard let viewController = storyboard?.instantiateViewController(withIdentifier: "HalfModalViewController") else { return }
    self.present(viewController, animated: true, completion: nil)
  }

  func selectedColor(mainCardColor: UIColor) {
    let indexPath = IndexPath(item: 0, section: 0)
    let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell
    cell?.cardView.backgroundColor = mainCardColor
    cardColor[indexPath.item] = mainCardColor
  }

  @IBOutlet weak var collectionView: UICollectionView!
  var cardColor : [UIColor] = [ .red, .orange, .green, .blue, .systemPink, .yellow,
                                .cyan, .purple, .brown,.black,.magenta, .lightGray ]

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
    cell.delegate = self
    print("Cell item : \(indexPath.item), section : \(indexPath.section)")

    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
