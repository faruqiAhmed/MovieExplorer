//
//  MovieTableViewCell.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var movieImgeView: UIImageView!
    
    
    static var identifier: String {
        get {
            "MovieTableViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state  
    }
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.titleLbl.text = viewModel.name
        self.movieImgeView.sd_setImage(with: viewModel.image)
    }
}
