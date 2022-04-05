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
    self.view.backgroundColor = mainCardColor
    self.collectionView.backgroundColor = mainCardColor
  }


  @IBOutlet weak var collectionView: UICollectionView!

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int)-> Int {
    return 12
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell",
                                                            for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }
    return mainCell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .darkGray
    collectionView.backgroundColor = UIColor.darkGray
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let HalfModalViewController = segue.destination as? HalfModalViewController {
      HalfModalViewController.deleagte = self
    }
  }
  
}

