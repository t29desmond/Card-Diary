//
//  ViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/02/21.
//

import UIKit

class HistoryViewController: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource,
                             WriteViewControllerDelegate {
  func writeViewControllerSaveButton(_ writeSave: WriteViewController, _ saveTextFiled: HistoryCollectionViewCellProperty) {
    self.cellProperties.append(saveTextFiled)
    collectionView.reloadData()
    writeSave.dismiss(animated: true, completion: nil)
  }
  
  var cellProperties: [HistoryCollectionViewCellProperty] = []
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return cellProperties.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            as? HitstoryCollectionViewCell else { return HitstoryCollectionViewCell() }
    
    let property = cellProperties[indexPath.item]
    cell.tagText.text = property.tagtexFiled
    cell.tagView.backgroundColor = .white
    cell.tagText.textColor = .black
    
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray6
    collectionView.backgroundColor = .systemGray6
    
  }
  
  @IBAction func tagAddButton(_ sender: UIButton) {
    guard let viewController = storyboard?
      .instantiateViewController(withIdentifier: "WriteViewController")
            as? WriteViewController else { return }
    viewController.delegate = self
    collectionView.reloadData()
    self.navigationController?.present(viewController, animated: true)
    viewController.modalPresentationStyle = .fullScreen
  }
  
  @IBAction func tagDiscardButton(_ sender: UIButton) {
    guard cellProperties.popLast() != nil else { return }
    print(cellProperties.count)
    collectionView.reloadData()
  }
}
