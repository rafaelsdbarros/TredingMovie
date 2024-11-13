//
//  DetailsMovieViewController.swift
//  TredingMovie
//
//  Created by Rafael on 14/11/24.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    //IBOutlet:
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //ViewModel:
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
    
    func configView(){
        self.title = "Movie Details"
        self.navigationController?.navigationBar.tintColor = .systemBlue
        self.titleLabel.text = viewModel.movieTitle
        self.descriptionLabel.text = viewModel.movieDescription
        self.imageView.sd_setImage(with: viewModel.movieImage)
    }

}
