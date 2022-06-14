//
//  ViewController.swift
//  Test FP number 3
//
//  Created by Ваня Науменко on 29.05.22.
//

import Firebase
import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    var ref: DatabaseReference!

    @IBOutlet var warnLabel: UILabel!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference(withPath: "users")

        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let _ = user else { return }
            self?.performSegue(withIdentifier: "toFirstVC", sender: nil)
            self?.emailTF.text = nil
            self?.passwordTF.text = nil
        }
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func lodingTapped() {
        guard let email = emailTF.text,
              let password = passwordTF.text,
              !email.isEmpty, !password.isEmpty
        else {
            dispalyWarningLabel(withText: "Empty value")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) {
            [weak self] user, error in
                if let error = error {
                    self?.dispalyWarningLabel(withText: "Registration error: \(error.localizedDescription)")
                } else if let _ = user {
                    self?.performSegue(withIdentifier: "toFirstVC", sender: nil)
                } else {
                    self?.dispalyWarningLabel(withText: "Something wrong")
                }
        }
    }

    @IBAction func registerTapped() {
        guard let email = emailTF.text,
              let password = passwordTF.text,
              !email.isEmpty, !password.isEmpty
        else {
            dispalyWarningLabel(withText: "Empty value")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                self?.dispalyWarningLabel(withText: "Registration error: \(error.localizedDescription)")
            } else if let user = user {
                let userRef = self?.ref.child(user.user.uid)
                userRef?.setValue(["email": user.user.email])
            }
        }
    }

    private func dispalyWarningLabel(withText text: String) {
        warnLabel.text = text

        UIView.animate(withDuration: 10, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) { [weak self] in
            self?.warnLabel.alpha = 1
        } completion: { [weak self] _ in
            self?.warnLabel.alpha = 0
        }
    }
}
