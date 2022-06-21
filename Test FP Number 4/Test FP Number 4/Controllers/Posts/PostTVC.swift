//
//  PostTVC.swift
//  Test FP number 3
//
//  Created by Ваня Науменко on 8.06.22.
//

import Firebase
import UIKit

final class PostTVC: UITableViewController {
    var user: User!
    var ref: DatabaseReference!
    var posts: [Posts] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // достаем текущего пользователя
        guard let postUser = Auth.auth().currentUser else { return }
        // сохраним currentUser
        user = User(user: postUser)
        // создаем reference
        ref = Database.database().reference(withPath: user.uidi).child(String(user.uidi)).child("posts")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // наблюдатель за значениями
        ref.observe(DataEventType.value) { [weak self] snapshot in
            var posts = [Posts]()
            for item in snapshot.children { // вытаскиваем все tasks
                guard let snapshot = item as? DataSnapshot,
                      let post = Posts(snapshot: snapshot) else { continue }
                posts.append(post)
            }
            self?.posts = posts
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return posts.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
        guard let cell = UIViewController() as? PostVC else { return }
        present(cell, animated: true, completion: nil)
    }
}
