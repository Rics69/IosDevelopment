//
//  ViewController.swift
//  HW2
//
//  Created by Данил Клементьев on 30.06.2023.
//

import UIKit

//class ContactsTable: UITableView{
//    @IBOutlet weak var titleLabel: UILabel!
//
//    func setUp(title: String){
//        titleLabel.text = title
//    }
//}

var data: [ListTableViewData] = [

]

class ContactsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell else{return UITableViewCell()}
        
        cell.setUp(data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
}

class ViewController: UIViewController {

    let phoneNumberPrefix = "8908"
    let password = "password"
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        guard let phoneNumberInput = phoneTextField.text, let passwordInput = passwordTextField.text else {
            displayErrorModal()
            return
        }
        
        if phoneNumberInput.hasPrefix(phoneNumberPrefix) && passwordInput == password {
            data.append(ListTableViewData(title: phoneNumberInput))
            pushContactsViewController()
        } else {
            displayErrorModal()
        }
    }
    
    func pushContactsViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactsViewController = (storyboard.instantiateViewController(withIdentifier: "ContactsTableViewController") as? ContactsTableViewController)!
        
        let navigationController = UINavigationController(rootViewController: contactsViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func displayErrorModal() {
        let alert = UIAlertController(title: "Ошибка", message: "Неверный номер телефона или пароль", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

