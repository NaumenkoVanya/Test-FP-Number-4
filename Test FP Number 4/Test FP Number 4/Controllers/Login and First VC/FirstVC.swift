//
//  FirstVC.swift
//  Test FP number 3
//
//  Created by Ваня Науменко on 29.05.22.
//

import Firebase
import SafariServices
import UIKit
import SafariServices

final class FirstVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction func singOutButton(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func personalAccoutButton(_ sender: UIBarButtonItem) {}
    
    @IBAction func photoButton() {}
    
    @IBAction func newsButton() {
        if let url = URL(string: "https://in-moto.ru/novosti/") {
<<<<<<< Updated upstream:Test FP Number 4/Test FP Number 4/Controllers/Login and First VC/FirstVC.swift
            let svc = SFSafariViewController(url: url)
=======
            let svc = SFSafariViewController(url: url )
>>>>>>> Stashed changes:Test FP Number 4/Test FP Number 4/Controllers/FirstVC.swift
            present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func mapButton() {}
    
    @IBAction func storiesButton() {}
}
