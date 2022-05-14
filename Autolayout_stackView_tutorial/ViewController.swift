//
//  ViewController.swift
//  Autolayout_stackView_tutorial
//
//  Created by ming on 2022/05/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var phoneNumbersBtns: [CircleButton]!
    @IBOutlet var phoneCallBtn: CircleButton!
    
    var phoneNumberString = ""{
        didSet{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else{return}
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for btnItem in phoneNumbersBtns{
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: .touchUpInside)
        }
        phoneCallBtn.addTarget(self, action: #selector(onPhoneCallBtnClicked(_sender:)), for: .touchUpInside)
    }
    @objc fileprivate func onNumberBtnClicked(sender: UIButton){
        guard let inputString = sender.titleLabel?.text else {return}
        phoneNumberString.append(inputString)
    }
    @objc fileprivate func onPhoneCallBtnClicked(_sender: UIButton){
        phoneNumberString.removeAll()
    }
}

