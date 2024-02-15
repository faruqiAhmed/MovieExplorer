//
//  MovieListViewController.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 15/2/24.
//

import UIKit

class MovieListViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate  {
   
    var cell = MovieListCollectionViewCell()
    @IBOutlet weak var movieListColl: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.movieListColl.dataSource=self
        self.movieListColl.delegate=self
        self.movieListColl.register(UINib(nibName: "MovieListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieListCollectionViewCell")
        let cellSize = CGSize(width:200 , height:182)
        
        self.navigationController?.isNavigationBarHidden = true
        

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        layout.itemSize = cellSize
//        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
//        layout.minimumLineSpacing = 1.0
//        layout.minimumInteritemSpacing = 1.0
        self.movieListColl.setCollectionViewLayout(layout, animated: true)
        self.movieListColl.isScrollEnabled=true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = movieListColl.dequeueReusableCell(withReuseIdentifier: "MovieListCollectionViewCell", for: indexPath) as! MovieListCollectionViewCell
        
        return cell
       
    }
   

}
