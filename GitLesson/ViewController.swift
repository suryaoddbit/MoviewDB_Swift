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
    var refreshControl : UIRefreshControl = UIRefreshControl()
    var iImage = 1
    

    
    
    
    var arrayMovie : [MovieModel] = []
    
    //MARK: New
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       setupCollectionView()
        refreshControl.beginRefreshing()
        downloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - View Lifecycle
    
    
    func downloadData(){
        Engine.shared.getListMovie {[weak self] (result, error) in
            guard let strongSelf = self else { return}
            
            strongSelf.refreshControl.endRefreshing()
            if let result = result as? [MovieModel]{
                strongSelf.arrayMovie = result
                strongSelf.cvMovie.reloadData()
            }else if let error = error{
                let alert = UIAlertController.init(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                
                let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okAction)
                strongSelf.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: - Configure
    
    func setupCollectionView(){
        refreshControl.addTarget(self, action: #selector(handleRefresh(sender:)), for: .valueChanged)
        
        cvMovie.addSubview(refreshControl)
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
    
    //MARK: - Action
    func handleRefresh(sender : UIRefreshControl){
//        iImage += 10
//        cvMovie.reloadData()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.cvMovie.reloadData()
//            self.refreshControl.endRefreshing()
//        }
        
        downloadData()
    }


}


//MARK: - UIcollectionViewdatasource

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieViewCell
        
        let movie = arrayMovie[indexPath.item];
        
        if (indexPath.row % 2 == 0){
            cell.ivMovie.image = UIImage(named: "img")
        }else{
            cell.ivMovie.image = UIImage(named: "img2")
        }
        
        /*
        if let url = URL(string: "\(IMG_URL)\((indexPath.row + 1) * iImage)"){
            cell.ivMovie.sd_setImage(with: url)
             cell.loadingIndicator.startAnimating()
             cell.ivMovie.sd_setImage(with: url, completed: { (image, error, cache, url) in
             if error == nil{
             cell.loadingIndicator.stopAnimating()
             }
             })
         
        }*/
        if let url =  movie.imageUrl{
            cell.loadingIndicator.startAnimating()
            cell.ivMovie.sd_setImage(with: url, completed: { (image, error, cache, url) in
                if error == nil{
                    cell.loadingIndicator.stopAnimating()
                }
            })
        }

        
       
        cell.lbTitle.text = movie.title?.uppercased()
        cell.lbSubtitle.text = movie.overview
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let movie = arrayMovie[indexPath.item];
        print(movie.title)
    }
    
    
}

