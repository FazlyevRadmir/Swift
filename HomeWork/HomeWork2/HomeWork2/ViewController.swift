//
//  ViewController.swift
//  HomeWork2
//
//  Created by Радмир Фазлыев on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var agreeSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Authorization"
        nextButton.setTitleColor(UIColor.white, for: .normal)
        numberTextField.placeholder = "Please, enter your phone number"
        agreeSwitch.isOn = false
    }

    
    @IBAction func buttonDidTap(_ sender: Any) {
        
        
        
        guard let phoneNumber = numberTextField.text else { return }
        if agreeSwitch.isOn == true && phoneNumber.count == 11 && phoneNumber.hasPrefix("89087") {
            
            guard let CorrectNumberVC = storyboard?.instantiateViewController(withIdentifier: "ContactsTableViewController") else { return }
            navigationController?.pushViewController(CorrectNumberVC, animated: true)
            
        } else {
            numberTextField.text = nil
            agreeSwitch.isOn = false
            guard let IncorrectNumberVC = storyboard?.instantiateViewController(withIdentifier: "IncorrectNumberViewController") else { return }
            present(IncorrectNumberVC, animated: true)
        }
    }
    
    
    //ViewController скоро будет показан пользователю
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    //ViewController был показан пользователю
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    //ViewController будет убран
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    //ViewController был убран
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        numberTextField.text = nil
        agreeSwitch.isOn = false
        print(#function)
    }
}

