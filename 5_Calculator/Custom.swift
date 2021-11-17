//
//  CustomButton.swift
//  5_Calculator
//
//  Created by 이윤수 on 2021/11/01.
//

import UIKit

class CustomButton:UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        btn()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        btn()
    }
    
    func btn(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        self.layer.masksToBounds = true
    }
    
    func sizefit(sv:UIStackView){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: sv.widthAnchor, multiplier: 0.25, constant: -10),
            self.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    func yellowBg(){
        self.backgroundColor = UIColor(red: 1, green: 0.6275, blue: 0.0392, alpha: 1.0)
        self.setTitleColor(.gray, for: .normal)
    }
    
    func acStyle(){
        self.backgroundColor = UIColor(red: 0.6471, green: 0.6471, blue: 0.6471, alpha: 1.0)
        self.setTitleColor(.black, for: .normal)
    }
    
}

class CustomStackView:UIStackView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sv()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        sv()
    }
    
    func sv(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .equalSpacing
        self.alignment = .fill
        self.spacing = 10
    }
}
