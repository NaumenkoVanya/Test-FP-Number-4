//
//  PostVC.swift
//  Test FP Number 4
//
//  Created by Ваня Науменко on 20.06.22.
//

import UIKit

final class PostVC: UIViewController {
    
    var titleText = ""
    var postText = ""
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = postText
        titleLabel.text = titleText
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
