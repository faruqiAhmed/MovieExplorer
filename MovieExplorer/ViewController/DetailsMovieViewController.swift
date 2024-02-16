//
//  DetailsMovieViewController.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import UIKit

class DetailsMovieViewController: UIViewController {
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    //View model
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
      //  self.title = "Movie Details"
        titleLbl.text = viewModel.movieTitle
     //  movieImageView.sd_setImage(with: viewModel.movieImage)
        overviewLbl.text = viewModel.movieDescription
    }

}
