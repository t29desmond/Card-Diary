//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.
//

import UIKit

class MainViewController: UIViewController, SaveColorDelegate {

  @IBOutlet weak var cardVIew: UIView!
  @IBOutlet weak var ellipsisBtn: UIButton!
  @IBOutlet weak var mainCustomViewLbl: CustomView!

  override func viewDidLoad() {
    super.viewDidLoad()
    cardVIew.backgroundColor = .black
    view.backgroundColor = .darkGray

    mainCustomViewLbl.mainMonthNum.text = "16"
    mainCustomViewLbl.mainMonthNum.font = mainCustomViewLbl.mainMonthNum.font.withSize(46)
    mainCustomViewLbl.mainMonthText.text = "MON"
    mainCustomViewLbl.mainMonthText.font = mainCustomViewLbl.mainMonthText.font.withSize(20)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let HalfModalViewController = segue.destination as? HalfModalViewController {
      HalfModalViewController.deleagte = self
    }
  }

  func selectedColor(mainCardColor: UIColor) {
    self.cardVIew.backgroundColor = mainCardColor
    }
  }

