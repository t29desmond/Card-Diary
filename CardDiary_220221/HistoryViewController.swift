//
//  HIstoryViewController.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/03/02.
//

import UIKit

class HistoryViewController: UIViewController {
     
     /*
      1. 새로운 ViewController(HistoryViewController)클래스를 생성해 Main.StroyBoard에 HistoryViewController에 있는 CustomView를 IBOutlet으로 연결한다.
      2. CustomView(Xib)에서 생성 및 정의한 IBOulet변수와 정의된 인스턴스를 customview의 프로퍼티를 접근할 수있다.
      */
    
    @IBOutlet weak var historyCardCustomView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyCardCustomView.mainMonthNum.text = "14"
        historyCardCustomView.mainMonthNum.font = historyCardCustomView.mainMonthNum.font.withSize(26)
        historyCardCustomView.mainMonthText.text = "MON"
        historyCardCustomView.mainMonthText.font = historyCardCustomView.mainMonthText.font.withSize(10)
        
    }
    
}
