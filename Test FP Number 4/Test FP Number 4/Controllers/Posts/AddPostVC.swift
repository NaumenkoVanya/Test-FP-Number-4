//
//  AddPostVC.swift
//  Test FP Number 4
//
//  Created by Ваня Науменко on 18.06.22.
//

import Firebase
import UIKit

// MARK: - AddPostVC

final class AddPostVC: UIViewController {
    var user: User!
    var ref: DatabaseReference!
    var posts = [Posts]()

    @IBOutlet var titlePost: UITextField!
    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: user.uidi).child(String(user.uidi)).child("posts")
    }

    @IBAction func saveButton() {
        if let titleText = titlePost.text,
           let postText = textView.text
        {
            let post = Posts(title: titleText, userId: "\(user.uidi)", post: "\(postText)")
            let postRef = ref.child(post.title.lowercased())
            postRef.setValue(post.convertToDictionary())
        } else { return }
    }
}

// MARK: UITextFieldDelegate

extension AddPostVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
