//
//  HomeViewController.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

/// This class was designed & implemented to: display NYTimes articles
final class HomeViewController: BaseViewController, ViewControllerProtocol {
    
    // MARK: - Outlets
    /// This variable is used to: Display a collection view holding the articles data
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.accessibilityIdentifier = "HomeCollectiioViewID"
            self.collectionView.register(UINib(nibName: NewsCollectionCell.className, bundle: Bundle.main), forCellWithReuseIdentifier: NewsCollectionCell.className)
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.backgroundColor = .clear
            self.collectionView.setRefreshcontrol(color: .white, target: self, action: #selector(self.refreshData))
            let layout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
            let aspect: CGFloat = Constants.cardHeight
            let width = UIScreen.main.bounds.width
            layout.itemSize = CGSize(width:width, height: width * aspect)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
    }
    
    // MARK: - Vars / Values
    /// This variable is used to: Fill the articles array and load them in collection view
    var tableArray = [ResultModel]()
    
    /// This variable is used to: Hold the current view controller's viewModel in order to handle its logic
    var viewModel =  HomeViewModel()
    
    /// This variable is used to: dispose RX variables
    let disposeBag = DisposeBag()
    
    /// This variable is used to: Handle animated transition from master to details
    var transition: CardTransition?
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - View Appear / View Disappear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - Setup View
    func setupView() {
        
        // Set nav title
        self.setTitle("NYTimes")
        
        // Setup Bindings
        self.setupBindings()
        
        // Setup view model
        Utils.delay(delay: 0.3) {
            self.setupViewModel()
        }
    }
    
    // MARK: - Setup Bindings
    func setupBindings() {

        // MARK: -  Set observer on: loading
        self.viewModel
            .loading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (loading) in
                loading ? self.collectionView.beginRefreshing() : self.collectionView.endRefreshing()
            }, onError: { (error) in}, onCompleted: {}) {}
            .disposed(by: disposeBag)
        
        // MARK: -  Set observer on: data
        self.viewModel
            .data
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (data) in
                self.tableArray = data
            }, onError: { (error) in}, onCompleted: {}) {}
            .disposed(by: disposeBag)
        
        // MARK: -  Set observer on: error
        self.viewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                Utils.showAlert(title: error, message: "", style: .alert)
            }, onError: { (error) in}, onCompleted: {}) {}
            .disposed(by: disposeBag)
        
        // MARK: -  Set observer on: reloadAnimated
        self.viewModel
            .reloadAnimated
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (reloadAnimated) in
                self.collectionView.reloadAsync()
            }, onError: { (error) in}, onCompleted: {}) {}
            .disposed(by: disposeBag)
    }
    
    // MARK: - Setup view model
    func setupViewModel() {
        self.viewModel.getData(fromRefresh: false)
    }
    
    // MARK: - Refresh data
    @objc func refreshData() {
        self.viewModel.getData(fromRefresh: true)
    }
}
