//
//  ViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CellUICollectionViewCell else { return CellUICollectionViewCell() }
        
        return cell
    }
    
    @IBOutlet weak var mainCardCustomView: CustomView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        mainCardCustomView.mainMonthNum.font = mainCardCustomView.mainMonthNum.font.withSize(70)
//        mainCardCustomView.mainMonthNum.text = "3"
//        mainCardCustomView.mainMonthText.text = "MAR"
    }
    


}



