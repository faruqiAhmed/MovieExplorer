//
//  MovieListCollectionViewCell.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 15/2/24.
//

import UIKit

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
        // Initialization code
    }
    
    func setupCell(viewModel: MovieCollCellViewModel) {
        self.titleLabel.text = viewModel.name
      //  self.imgeView.image(with: viewModel.image)
    }
}

//class   MovieTableCellViewModel {
//    var id: Int
//    var name: String
//    var date: String
//    var score: String
//    var image: URL?
//    
//    init(movie: Movie) {
//        self.id = movie.id
//        self.name = movie.name ?? movie.title ?? ""
//        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
//        self.score = "\(movie.voteAverage)/10"
//        self.image = makeImageURL(movie.posterPath ?? "")
//    }
//    
//    private func makeImageURL(_ imageCode: String) -> URL? {
//        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
//    }
//}
import UIKit

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache

    func loadImage(with url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
