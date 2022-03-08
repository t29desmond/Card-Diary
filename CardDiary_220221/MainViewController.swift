//
//  MainViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/04.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainCustomViewLbl: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainCustomViewLbl.mainMonthNum.text = "16"
        mainCustomViewLbl.mainMonthNum.font = mainCustomViewLbl.mainMonthNum.font.withSize(46)
        mainCustomViewLbl.mainMonthText.text = "MON"
        mainCustomViewLbl.mainMonthText.font = mainCustomViewLbl.mainMonthText.font.withSize(20)
    
    }
}
