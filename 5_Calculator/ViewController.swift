//
//  ViewController.swift
//  5_Calculator
//
//  Created by 이윤수 on 2021/11/01.
//

import UIKit

enum Operation{
    case Add
    case Subract
    case Divide
    case Multiply
    case Unknown
}

class ViewController: UIViewController {
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperand:Operation = .Unknown
    
    var value : UILabel!
    var main_StackView : UIStackView!
    var start: CustomButton!
    
    var main_view: UIView!
    
    var ac: CustomButton!
    var division: CustomButton!
    var plus: CustomButton!
    var minus: CustomButton!
    var mp: CustomButton!
    var com : CustomButton!
    
    var one: CustomButton!
    var two: CustomButton!
    var three: CustomButton!
    var four: CustomButton!
    var five: CustomButton!
    var six: CustomButton!
    var seven: CustomButton!
    var eight: CustomButton!
    var nine: CustomButton!
    var zero: CustomButton!
    
    var one_line : CustomStackView!
    var two_line : CustomStackView!
    var three_line : CustomStackView!
    var four_line : CustomStackView!
    var five_line : CustomStackView!
    
    var yellowColor = UIColor(red: 1, green: 0.6275, blue: 0.0392, alpha: 1.0)
    
    
    override func viewDidLoad() {
        
        // 초기화
        self.start = CustomButton(type: .custom)
        
        self.ac = CustomButton(type: .custom)
        self.division = CustomButton(type: .custom)
        self.plus = CustomButton(type: .custom)
        self.minus = CustomButton(type: .custom)
        self.mp = CustomButton(type: .custom)
        self.com = CustomButton(type: .custom)
        
        self.one = CustomButton(type: .custom)
        self.two = CustomButton(type: .custom)
        self.three = CustomButton(type: .custom)
        self.four = CustomButton(type: .custom)
        self.five = CustomButton(type: .custom)
        self.six = CustomButton(type: .custom)
        self.seven = CustomButton(type: .custom)
        self.eight = CustomButton(type: .custom)
        self.nine = CustomButton(type: .custom)
        self.zero = CustomButton(type: .custom)
        
        self.one_line = CustomStackView()
        self.two_line = CustomStackView()
        self.three_line = CustomStackView()
        self.four_line = CustomStackView()
        self.five_line = CustomStackView()
        
        
        // 뷰 컬러
        self.view.backgroundColor = .black
        
        
        // 메인 뷰 + 스택 뷰
        self.main_view = UIView()
        self.main_view.backgroundColor = .black
        self.main_view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.main_view)
        
        NSLayoutConstraint.activate([
            self.main_view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6),
            self.main_view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.main_view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.main_view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        self.main_StackView = UIStackView()
        
        self.main_StackView.axis = .vertical
        self.main_StackView.alignment = .fill
        self.main_StackView.distribution = .equalCentering
        self.main_StackView.spacing = 10
        self.main_StackView.translatesAutoresizingMaskIntoConstraints = false
        self.main_view.addSubview(main_StackView)
        
        NSLayoutConstraint.activate([
            self.main_StackView.bottomAnchor.constraint(equalTo: self.main_view.bottomAnchor, constant: -5),
            self.main_StackView.leadingAnchor.constraint(equalTo: self.main_view.leadingAnchor, constant: 10),
            self.main_StackView.trailingAnchor.constraint(equalTo: self.main_view.trailingAnchor, constant: -10)
        ])
        
        
        // 값 라벨
        self.value = UILabel()
        self.value.text = "0"
        self.value.textColor = .white
        self.value.textAlignment = .right
        self.value.font = UIFont.systemFont(ofSize: 40)
        self.value.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.value)
        
        NSLayoutConstraint.activate([
            self.value.leadingAnchor.constraint(equalTo: self.main_StackView.leadingAnchor),
            self.value.trailingAnchor.constraint(equalTo: self.main_StackView.trailingAnchor),
            self.value.bottomAnchor.constraint(equalTo: self.main_StackView.topAnchor, constant: -15)
        ])
        
        
        // ac, /
        self.ac.setTitle("ac", for: .normal)
        self.division.setTitle("/", for: .normal)
        
        self.five_line.addArrangedSubview(self.ac)
        self.five_line.addArrangedSubview(self.division)
        
        self.main_StackView.addArrangedSubview(five_line)
        
        // 7,8,9,*
        self.seven.setTitle("7", for: .normal)
        self.eight.setTitle("8", for: .normal)
        self.nine.setTitle("9", for: .normal)
        self.mp.setTitle("X", for: .normal)
        
        self.four_line.addArrangedSubview(self.seven)
        self.four_line.addArrangedSubview(self.eight)
        self.four_line.addArrangedSubview(self.nine)
        self.four_line.addArrangedSubview(self.mp)
        
        self.main_StackView.addArrangedSubview(four_line)
        
        // 4,5,6,-
        self.four.setTitle("4", for: .normal)
        self.five.setTitle("5", for: .normal)
        self.six.setTitle("6", for: .normal)
        self.minus.setTitle("-", for: .normal)
        
        self.three_line.addArrangedSubview(self.four)
        self.three_line.addArrangedSubview(self.five)
        self.three_line.addArrangedSubview(self.six)
        self.three_line.addArrangedSubview(self.minus)
        
        self.main_StackView.addArrangedSubview(three_line)
        
        // 1,2,3,+
        self.one.setTitle("1", for: .normal)
        self.two.setTitle("2", for: .normal)
        self.three.setTitle("3", for: .normal)
        self.plus.setTitle("+", for: .normal)
        
        self.two_line.addArrangedSubview(self.one)
        self.two_line.addArrangedSubview(self.two)
        self.two_line.addArrangedSubview(self.three)
        self.two_line.addArrangedSubview(self.plus)
        
        self.main_StackView.addArrangedSubview(two_line)
        
        // 0, =, .
        self.zero.setTitle("0", for: .normal)
        self.com.setTitle(".", for: .normal)
        self.start.setTitle("=", for: .normal)
        
        self.one_line.addArrangedSubview(self.zero)
        self.one_line.addArrangedSubview(self.com)
        self.one_line.addArrangedSubview(self.start)
        
        self.main_StackView.addArrangedSubview(one_line)
        
        // 정렬
        self.start.sizefit(sv: self.one_line)
        self.com.sizefit(sv: self.one_line)
        
        self.one.sizefit(sv: self.two_line)
        self.two.sizefit(sv: self.two_line)
        self.three.sizefit(sv: self.two_line)
        self.plus.sizefit(sv: self.two_line)
        
        self.four.sizefit(sv: self.three_line)
        self.five.sizefit(sv: self.three_line)
        self.six.sizefit(sv: self.three_line)
        self.minus.sizefit(sv: self.three_line)
        
        self.seven.sizefit(sv: self.four_line)
        self.eight.sizefit(sv: self.four_line)
        self.nine.sizefit(sv: self.four_line)
        self.mp.sizefit(sv: self.four_line)
        
        self.division.sizefit(sv: self.five_line)
        
        NSLayoutConstraint.activate([
            self.zero.leadingAnchor.constraint(equalTo: self.one.leadingAnchor),
            self.zero.trailingAnchor.constraint(equalTo: self.two.trailingAnchor),
            self.zero.heightAnchor.constraint(equalTo: self.nine.widthAnchor),
            self.ac.leadingAnchor.constraint(equalTo: self.one.leadingAnchor),
            self.ac.trailingAnchor.constraint(equalTo: self.three.trailingAnchor),
            self.ac.heightAnchor.constraint(equalTo: self.nine.widthAnchor),
            
        ])
        
        // 색상
        self.ac.acStyle()
        self.plus.yellowBg()
        self.minus.yellowBg()
        self.division.yellowBg()
        self.mp.yellowBg()
        self.start.yellowBg()
        
        // 함수 이벤트 처리
        self.one.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.two.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.three.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.four.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.five.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.six.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.seven.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.eight.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.nine.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        self.zero.addTarget(self, action: #selector(tapNumber(sender:)), for: .touchUpInside)
        
        self.ac.addTarget(self, action: #selector(tapClear(sender:)), for: .touchUpInside)
        
        self.com.addTarget(self, action: #selector(tapCom(sender:)), for: .touchUpInside)
        
        self.division.addTarget(self, action: #selector(tapDivision(sender:)), for: .touchUpInside)
        self.plus.addTarget(self, action: #selector(tapPlus(sender:)), for: .touchUpInside)
        self.minus.addTarget(self, action: #selector(tapMinus(sender:)), for: .touchUpInside)
        self.mp.addTarget(self, action: #selector(tapMp(sender:)), for: .touchUpInside)
        self.start.addTarget(self, action: #selector(tapStart(sender:)), for: .touchUpInside)
        
    }
    
    @objc func tapNumber(sender: UIButton){
        guard let numberValue = sender.title(for: .normal) else {return }
        
        if self.displayNumber.count < 9{
            self.displayNumber += numberValue
            self.value.text = self.displayNumber
        }
        
        bgColorBack()
        
        
        
    }
    
    @objc func tapClear(sender: UIButton){
        self.displayNumber = ""
        self.value.text = "0"
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperand = .Unknown
        
        bgColorBack()
    }
    
    @objc func tapCom(sender: UIButton){
        if self.displayNumber.count < 8 && !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.value.text = self.displayNumber
        }
    }
    
    @objc func tapDivision(sender: UIButton){
        self.operation(.Divide)
        bgClick(sender: sender)
    }
    
    @objc func tapMp(sender: UIButton){
        self.operation(.Multiply)
        bgClick(sender: sender)
    }
    
    @objc func tapMinus(sender: UIButton){
        self.operation(.Subract)
        bgClick(sender: sender)
    }
    
    @objc func tapPlus(sender: UIButton){
        self.operation(.Add)
        bgClick(sender: sender)
    }
    
    @objc func tapStart(sender: UIButton){
        self.operation(self.currentOperand)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperand != .Unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperand {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                    
                case .Subract:
                    self.result = "\(firstOperand - secondOperand)"
                    
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                    
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                    
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.value.text = self.result
            }else{
            }
            
            self.currentOperand = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperand = operation
            self.displayNumber = ""
        }
    }
    
    func bgClick(sender:UIButton){
        
        bgColorBack()
        
        if self.displayNumber != ""{
            self.firstOperand = self.displayNumber
        }
        
        self.displayNumber = ""
    }
    
    func bgColorBack(){
        self.plus.backgroundColor = self.currentOperand == .Add ? .white : self.yellowColor
        self.minus.backgroundColor = self.currentOperand == .Subract ? .white : self.yellowColor
        self.mp.backgroundColor = self.currentOperand == .Multiply ? .white : self.yellowColor
        self.division.backgroundColor = self.currentOperand == .Divide ? .white : self.yellowColor
    }
}

