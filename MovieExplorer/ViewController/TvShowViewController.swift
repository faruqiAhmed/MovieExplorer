//
//  TvShowViewController.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import UIKit

class TvShowViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    var cells = TvShowCollectionViewCell()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tvShowCollView: UICollectionView!
    //ViewModel
    var viewModel: TvShowViewModel = TvShowViewModel()
    //Variables:
   var moviesDataSource: [TvShowCollViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
        viewModel.getDataTV()
        self.tvShowCollView.dataSource=self
                self.tvShowCollView.delegate=self
                self.tvShowCollView.register(UINib(nibName: "TvShowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TvShowCollectionViewCell")
                let cellSize = CGSize(width:120 , height:120)
        
                self.navigationController?.isNavigationBarHidden = true
        
        
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal //.horizontal
                layout.itemSize = cellSize
                layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
                layout.minimumLineSpacing = 1.0
                layout.minimumInteritemSpacing = 1.0
                self.tvShowCollView.setCollectionViewLayout(layout, animated: true)
                self.tvShowCollView.isScrollEnabled=true
      
    }
    func configView() {
        DispatchQueue.main.async {
            self.tvShowCollView.reloadData()
        }
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                   self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            self.moviesDataSource = movies
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.numberOfRows(in: section)
    }
    
    func  numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvShowCollectionViewCell.identifier, for: indexPath) as? TvShowCollectionViewCell else {
            return cells
        }
      cell.setupCell(viewModel: moviesDataSource[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let movieId = moviesDataSource[indexPath.row].id
            self.openDetails(movieId: movieId)
    }
    func openDetails(movieId: Int) {
        guard let movie = viewModel.retriveMovie(withId: movieId) else {
            return
        }
        DispatchQueue.main.async {
            let detailsViewModel = DetailsMovieViewModel(movie: movie)
            let controller = DetailsMovieViewController(viewModel: detailsViewModel)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
