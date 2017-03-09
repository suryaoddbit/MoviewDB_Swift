//
//  ViewController.swift
//  GitLesson
//
//  Created by I Wayan Surya Adi Yasa on 3/9/17.
//  Copyright © 2017 ODDBIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cvMovie: UICollectionView!
    
    //MARK: New
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - View Lifecycle
    
    //MARK: - Configure
    
    func setupCollectionView(){
        cvMovie.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        flowLayout.minimumInteritemSpacing = 4
        flowLayout.minimumLineSpacing = 4
        //view.layoutIfNeeded()
        //let width = view.bounds.width
        
        let width : CGFloat = (UIScreen.main.bounds.width - 24) / 2
        let height : CGFloat = 80 + ((width / 3) * 4)
        
        flowLayout.itemSize = CGSize(width: width, height: height)
        
        cvMovie.setCollectionViewLayout(flowLayout, animated: false)
        
        
        
    }


}


//MARK: - UIcollectionViewdatasource

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieViewCell
        
        if (indexPath.row % 2 == 0){
            cell.ivMovie.image = UIImage(named: "img")
        }else{
            cell.ivMovie.image = UIImage(named: "img2")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
}

