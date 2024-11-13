//
//  MainViewController.swift
//  TredingMovie
//
//  Created by Rafael on 12/11/24.
//

import UIKit

class MainViewController: UIViewController {

    //IBOutlet:
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var uiActivityIndicator: UIActivityIndicatorView!
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //Variables:
    var cellDataSouce: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top Trending Movies"
        self.view.backgroundColor = .systemBackground

        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
   func configView(){
               
       setupTableView()
        
    }
    
    func bindViewModel(){
        //bind data loading
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.uiActivityIndicator.startAnimating()
                }else {
                     self.uiActivityIndicator.stopAnimating()
                }
            }
        }
        //bind cell data souce
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSouce = movies
            self.realoadTableView()
        }
    }
    
    func openDetails(movieID: Int) {
        guard let movie = viewModel.retriveMovie(with: movieID) else {
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)

        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        
        self.registerCells()
    }
    
    func realoadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCells(){
        tableView.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else {
            return UITableViewCell()
        }

        let cellViewModel = self.cellDataSouce[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        cell.selectionStyle = .default
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieID = cellDataSouce[indexPath.row].id
        self.openDetails(movieID: movieID)
    }
}

