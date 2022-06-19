//
//  Posts.swift
//  Test FP Number 4
//
//  Created by Ваня Науменко on 19.06.22.
//

import Firebase
import Foundation

struct Posts {
    
    // MARK: Internal

    let title: String
    let userId: String
    let post: String
    let ref: DatabaseReference?
   
    init(title: String, userId: String, post: String) {
        self.title = title
        self.userId = userId
        self.post = post
        self.ref = nil
    }

    init?(snapshot: DataSnapshot) {
        guard let snapshotValue = snapshot.value as? [String: Any],
              let title = snapshotValue[Constants.titleKey] as? String,
              let userId = snapshotValue[Constants.userIdKey] as? String,
              let post = snapshotValue[Constants.postsKey] as? String else { return nil }
        self.title = title
        self.userId = userId
        self.post = post
        ref = snapshot.ref
    }

    func convertToDictionary() -> [String: Any] {
        [Constants.titleKey: title, Constants.userIdKey: userId, Constants.postsKey: post]
    }

    // MARK: Private

    private enum Constants {
        static let titleKey = "title"
        static let userIdKey = "userId"
        static let postsKey = "post"
    }
}
