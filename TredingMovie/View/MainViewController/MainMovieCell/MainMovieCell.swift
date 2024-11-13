//
//  MainMovieCell.swift
//  TredingMovie
//
//  Created by Rafael on 14/11/24.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }

    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!  
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
    func configUI() {
        backview.addBorder(color: .label, width: 1)
        backview.round()
        movieImageView.round(5)
        backview.backgroundColor = .lightGray
    }
}
