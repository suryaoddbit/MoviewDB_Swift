//
//  MovieViewCell.swift
//  GitLesson
//
//  Created by I Wayan Surya Adi Yasa on 3/9/17.
//  Copyright © 2017 ODDBIT. All rights reserved.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var ivMovie: UIImageView!{
        didSet{
            ivMovie.image = UIImage(named: "img")
        }
    }
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubtitle: UILabel!
    
    
    
}
