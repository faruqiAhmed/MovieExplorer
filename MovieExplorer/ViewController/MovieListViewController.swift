//
//  MovieListViewController.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 15/2/24.
//

import UIKit

class MovieListViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate  {
    var cells = MovieListCollectionViewCell()
    @IBOutlet weak var movieListColl: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //ViewModel
    var viewModel: MovieListViewModel = MovieListViewModel()
    //Variables:
   var moviesDataSource: [MovieCollCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
        viewModel.getData()
        
        self.movieListColl.dataSource=self
                self.movieListColl.delegate=self
                self.movieListColl.register(UINib(nibName: "MovieListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieListCollectionViewCell")
                let cellSize = CGSize(width:120 , height:120)
        
                self.navigationController?.isNavigationBarHidden = true
        
        
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal //.horizontal
                layout.itemSize = cellSize
                layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
                layout.minimumLineSpacing = 1.0
                layout.minimumInteritemSpacing = 1.0
                self.movieListColl.setCollectionViewLayout(layout, animated: true)
                self.movieListColl.isScrollEnabled=true
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    func configView() {
        DispatchQueue.main.async {
            self.movieListColl.reloadData()
        }
      //  self.setupTableView()
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCollectionViewCell.identifier, for: indexPath) as? MovieListCollectionViewCell else {
            return cells
        }
        cell.setupCell(viewModel: moviesDataSource[indexPath.row])
       // cell.selectionStyle = .none
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
