//
//  ViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainCardCustomView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  Main Card 문자열
        mainCardCustomView.mainMonthNum.font = mainCardCustomView.mainMonthNum.font.withSize(70)
        mainCardCustomView.mainMonthNum.text = "3"

        mainCardCustomView.mainMonthText.text = "MAR"
    }


}

