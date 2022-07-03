//
//  ContactsTableViewController.swift
//  HomeWork2
//
//  Created by Радмир Фазлыев on 02.07.2022.
//

import UIKit

struct Contact {
    let name: String
    let phoneNumber: String
}

class ContactsTableViewController: UITableViewController {
    
//    private let userDefaults = UserDefaults.standard
//    private let key = "CreateButtonDidTap"
    
    private var contacts: [Contact] = [
        Contact(name: "Radmir Fazlyev", phoneNumber: "89274419443"),
        Contact(name: "Karina Khairullina", phoneNumber: "89078885445"),
        Contact(name: "Den Vadim", phoneNumber: "88005553555")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if userDefaults .bool(forKey: key) {
//            view.backgroundColor = .systemRed
//        } else {
//            view.backgroundColor = .systemGreen
//        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as? ContactsTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = contacts[indexPath.row].name
        cell.phoneNumberLabel.text = contacts[indexPath.row].phoneNumber
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(contacts[indexPath.row])
        guard let ContactInformationVC = storyboard?.instantiateViewController(withIdentifier: "ContactInformationViewController") as? ContactInformationViewController else { return }
        ContactInformationVC.contact = contacts[indexPath.row]
        present(ContactInformationVC, animated: true)
        
        
        
    }
    
    @IBAction func createButtonDidTap(_ sender: Any) {
        guard let createVC = storyboard?.instantiateViewController(withIdentifier: "CreateContactViewController") as? CreateContactViewController else { return }
        
        createVC.delegate = self
//        userDefaults.set(true, forKey: key)
        present(createVC, animated: true)
    }
}


extension ContactsTableViewController: CreateContactDelegate {
    func saveContact(contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
