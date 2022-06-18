//
//  PhotosCVC.swift
//  Test FP Number 4
//
//  Created by Ваня Науменко on 16.06.22.
//

import UIKit

private let reuseIdentifier = "Cell"

// MARK: - PhotosCVC

class PhotosCVC: UICollectionViewController {
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1 ... 19 {
            let image = UIImage(named: "\(i)")!
            images.append(image)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        let layout = UICollectionViewFlowLayout()
        let sizeWH = UIScreen.main.bounds.width / 3 - 15
        layout.itemSize = CGSize(width: sizeWH, height: sizeWH)
        collectionView.collectionViewLayout = layout
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageVC
        let image = images[indexPath.item]
        cell.photoView.image = image
        return cell
    }
}
