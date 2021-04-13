//
//  FirstSectionCV.swift
//  Task7_AmazonPrime
//
//  Created by Neha Penkalkar on 20/03/21.
//

import UIKit

class FirstSectionCV: UICollectionView, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    let imgArr = ["13 Reasons Why","Breaking Bad","Brooklyn Nine-Nine","Chernobyl","Elite"]
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCVC", for: indexPath) as! FirstSectionCVC
        cell.FirstSecImg.image = UIImage(named: "\(imgArr[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}
