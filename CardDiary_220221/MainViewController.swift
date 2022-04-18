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
  
  }

  @IBOutlet weak var collectionView: UICollectionView!

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int)-> Int {
    return 12
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                        for: indexPath)
            as? MainCollectionViewCell else { return MainCollectionViewCell() }


    cell.backgroundColor = .brown
    cell.numindex = indexPath.item
    cell.cellIndexNum()

    
    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func ellipsisBtn(_ sender: UIButton) {
    guard let viewController = storyboard?
      .instantiateViewController(withIdentifier: "HalfModalViewController")
            as? HalfModalViewController else { return }
    //     화면전환 할 인스턴스를 넘겨준다. = viewController
    viewController.deleagte = self
    present(viewController, animated: true, completion: nil)
  }
}

