//
//  DetailViewControllerViewModel.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import Foundation
protocol DetailViewControllerViewModelProtocol {
    var view: DetailViewControllerInterface? { get set }
    func viewDidLoad()
    func configureViews(with: RickanMortyModelResult )
   
}
final class DetailViewControllerViewModel {
   weak var view: DetailViewControllerInterface?
     var model:RickanMortyModelResult!
}

extension DetailViewControllerViewModel: DetailViewControllerViewModelProtocol {
    func viewDidLoad() {
        view?.addSubViews()
    }
    
    func configureViews(with: RickanMortyModelResult) {
        view?.configureViews(with: model)
    }
    
    }
