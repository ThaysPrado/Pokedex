//
//  ViewController.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.lato(with: .bold, forTextStyle: .title1)
        label.textColor = UIColor(color: .black)
        label.text = "Pokedex"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.lato(with: .bold, forTextStyle: .body)
        label.textColor = UIColor(color: .black)
        label.numberOfLines = 0
        label.text = "Search for Pokemon by name or using the National Pokedex number"
        return label
    }()
    
    private lazy var searchInput: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    weak var coordinator: MainCoordinator?
    
    var heightCell = CGFloat(110)
    
    var viewModel: ViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pokedex"
        
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor(color: .white)
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(searchInput)
        view.addSubview(collectionView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }
        
        searchInput.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(48)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchInput.snp.bottom).offset(10)
            make.left.bottom.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }
    }
    
    func getPokemonList() {
//        self.viewModel?.offset = 0
//        DispatchQueue.global(qos: .background).async {
//            self.viewModel?.clearSearch()
//            self.viewModel?.getPokemonList()
//        }
    }
    
}

// MARK: - Delegates
extension ViewController: UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height
        let buffer: CGFloat = CGFloat(self.heightCell * 5)
        let scrollPosition = scrollView.contentOffset.y
        let lastContentOffset = 0
        if (lastContentOffset < Int(scrollView.contentOffset.y)) {
           if scrollPosition > bottom - buffer {
//                self.viewModel?.getPokemonList()
           }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / CGFloat(3)
        self.heightCell = width
        return CGSize(width: (width - 15), height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

