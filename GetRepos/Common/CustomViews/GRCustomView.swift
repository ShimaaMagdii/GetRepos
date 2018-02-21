//
//  GRCustomView.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
@IBDesignable
class GRCustomView : UIView {
    // MARK: - IBInspectable
    @IBInspectable
    var borderNewColor:UIColor  = UIColor.clear
    
    @IBInspectable
    var cornerRadius:CGFloat  = 4
    
    @IBInspectable
    var borderWidth :CGFloat  = 3.0
    
    // MARK: - Methods
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.borderColor = borderNewColor.cgColor
    }
    
    
}
