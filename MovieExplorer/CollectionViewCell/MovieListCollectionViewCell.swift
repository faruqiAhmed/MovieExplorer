//
//  MovieListCollectionViewCell.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 15/2/24.
//

import UIKit
import SDWebImage
class MovieListCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        get {
            "MovieListCollectionViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "MovieListCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgeView.layer.borderWidth = 1.5
        imgeView.layer.borderColor = UIColor.gray.cgColor
        imgeView.clipsToBounds = true
        
    }
    
    func setupCell(viewModel: MovieCollCellViewModel) {
        self.titleLabel.text = viewModel.name
        imgeView.sd_setImage(with: viewModel.image)
    }
}





