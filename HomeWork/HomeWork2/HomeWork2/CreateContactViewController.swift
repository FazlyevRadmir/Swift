//
//  CreateContactViewController.swift
//  HomeWork2
//
//  Created by Радмир Фазлыев on 02.07.2022.
//


protocol CreateContactDelegate: AnyObject {
    func saveContact(contact: Contact)
}

import UIKit

class CreateContactViewController: UIViewController {

    @IBOutlet weak var contactNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    weak var delegate: CreateContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let name = contactNameTextField.text,
              let phoneNumber = phoneNumberTextField.text
        else { return }
        
        let contact = Contact(name: name, phoneNumber: phoneNumber)
        delegate?.saveContact(contact: contact)
        dismiss(animated: true )
    }
}
