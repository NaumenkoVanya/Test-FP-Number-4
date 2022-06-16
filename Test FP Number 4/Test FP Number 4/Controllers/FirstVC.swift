//
//  FirstVC.swift
//  Test FP number 3
//
//  Created by Ваня Науменко on 29.05.22.
//

import Firebase
import UIKit

class FirstVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
    @IBAction func singOutButton(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func personalAccoutButton(_ sender: UIBarButtonItem) {}
    
    @IBAction func photoButton() {
        
    }
    
    @IBAction func newsButton() {}
    
    @IBAction func mapButton() {}
    
    @IBAction func storiesButton() {}
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showPosts",
//           let postsVC = segue.destination as? PostsTableViewController {
//            postsVC.user = user
//        } else if segue.identifier == "albomsSegue",
//                  let albomsTableVC = segue.destination as? AlbomsTableVC {
//            albomsTableVC.user = user
//        }
//    }
}
