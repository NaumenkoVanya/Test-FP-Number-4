//
//  AddPostVC.swift
//  Test FP Number 4
//
//  Created by Ваня Науменко on 18.06.22.
//

import UIKit

// MARK: - AddPostVC

class AddPostVC: UIViewController {
    @IBOutlet var titlePost: UITextField!
    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: UITextFieldDelegate

extension AddPostVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
