//
//  ContactInformationViewController.swift
//  HomeWork2
//
//  Created by Радмир Фазлыев on 02.07.2022.
//
import UIKit

class ContactInformationViewController: UIViewController {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var contact: Contact?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contact = contact else {
            return
        }
        
        contactNameLabel.text = contact.name
        phoneNumberLabel.text = contact.phoneNumber
    }
    
    @IBAction func closeInformButtonDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
}
 
