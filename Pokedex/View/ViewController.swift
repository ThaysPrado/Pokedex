//
//  ViewController.swift
//  Pokedex
//
//  Created by Thays Prado on 10/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var inputSearch: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var coordinator: MainCoordinator?
    
    var heightCell = CGFloat(110)
    
    var viewModel: ViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
    }
    
    func bindViewModel() {
        viewModel = ViewModel()
        
        viewModel?.items.asObservable().bind(to: collectionView.rx.items(cellIdentifier: "pokemonCell", cellType: PokemonCollectionCell.self)) {
            row, item, cell in
            cell.setup(withViewModel: item)
        }.disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(PokemonItem.self)
           .map{ $0.name }
           .subscribe(onNext: { [weak self] name in
              guard let name = name else {
                return
              }
              self?.coordinator?.toPokeInfo(name: name)
        }).disposed(by: disposeBag)
    }
    
    @IBAction func searchPokemon(_ sender: UIButton) {
        defer { self.inputSearch.text = "" }
        
        guard let searchName = inputSearch.text, inputSearch.text != "" else {
            return
        }
        
        viewModel?.searchName = searchName
        
        DispatchQueue.global(qos: .background).async {
            self.viewModel?.searchPokemonByName()
        }
    }
    
}

extension ViewController: UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height
        let buffer: CGFloat = CGFloat(self.heightCell * 5)
        let scrollPosition = scrollView.contentOffset.y
        let lastContentOffset = 0
        if (lastContentOffset < Int(scrollView.contentOffset.y)) {
           if scrollPosition > bottom - buffer {
                self.viewModel?.getPokemonList()
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

