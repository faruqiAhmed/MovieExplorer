//
//  TvShowCollectionViewCell.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import UIKit


import SDWebImage
class TvShowCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        get {
            "TvShowCollectionViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "TvShowCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(viewModel: TvShowCollViewModel) {
        self.titleLabel.text = viewModel.name
        imgeView.sd_setImage(with: viewModel.image)
    }

}

