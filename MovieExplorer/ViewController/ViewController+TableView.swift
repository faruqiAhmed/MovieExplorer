////
////  ViewController+TableView.swift
////  MovieExplorer
////
////  Created by Md Omar Faruq on 16/2/24.
////
//
//import Foundation
//import UIKit
//
//extension MovieListViewController:  UICollectionViewDataSource,UICollectionViewDelegate {
//
//    
//    func setupTableView() {
//        self.movieListColl.dataSource=self
//        self.movieListColl.delegate=self
//        self.movieListColl.register(UINib(nibName: "MovieListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieListCollectionViewCell")
//        let cellSize = CGSize(width:200 , height:182)
//        
//        self.navigationController?.isNavigationBarHidden = true
//       
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal //.horizontal
//        layout.itemSize = cellSize
////        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
////        layout.minimumLineSpacing = 1.0
////        layout.minimumInteritemSpacing = 1.0
//        self.movieListColl.setCollectionViewLayout(layout, animated: true)
//        self.movieListColl.isScrollEnabled=true
//        
//        self.registerCells()
//    }
//    
//    func reloadTableView() {
//        DispatchQueue.main.async {
//            self.movieListColl.reloadData()
//        }
//    }
//    
//    func registerCells() {
//        self.movieListColl.register(MovieListCollectionViewCell.register(), forCellWithReuseIdentifier: MovieListCollectionViewCell.identifier)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel.numberOfSections()
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCollectionViewCell.identifier, for: indexPath) as? MovieListCollectionViewCell else {
//            return cell
//        }
//        cell.setupCell(viewModel: moviesDataSource[indexPath.row])
//     //   cell.selectionStyle = .none
//        return cell
//        
//    }
//    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
////            return UITableViewCell()
////        }
////        cell.setupCell(viewModel: moviesDataSource[indexPath.row])
////        cell.selectionStyle = .none
////        return cell
////    }
////    
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let movieId = moviesDataSource[indexPath.row].id
////        self.openDetails(movieId: movieId)
////    }
//}
