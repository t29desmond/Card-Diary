//
//  CustomView.swift
//  CardDiary_220221
//
//  Created by 윤대식 on 2022/02/28.
//
import Foundation
import UIKit

@IBDesignable

class CustomView: UIView {
    
    @IBOutlet weak var mainMonthNum: UILabel!
    @IBOutlet weak var mainMonthText: UILabel!
    
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         xibSetup()
     }

     override func prepareForInterfaceBuilder() {
         super.prepareForInterfaceBuilder()
          xibSetup()
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         xibSetup()
     }
     
    func xibSetup() {
        guard let view = loadViewFromNib(nib: "CustomView") else {
             return
         }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
  //  CustomView 생성
        mainMonthNum.font = mainMonthNum.font.withSize(70)
        mainMonthNum.text = "3"

        mainMonthText.text = "MAR"
     
    }
    
     func loadViewFromNib(nib: String) -> UIView? {
         let bundle = Bundle(for: type(of: self))
         let nib = UINib(nibName: nib, bundle: bundle)
         return nib.instantiate(withOwner: self, options: nil).first as? UIView
     }
 }

