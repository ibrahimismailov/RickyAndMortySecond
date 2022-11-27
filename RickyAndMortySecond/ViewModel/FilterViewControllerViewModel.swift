//
//  FilterViewControllerViewModel.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import Foundation

protocol FilterViewControllerViewModelProtocol {
    var  view: FilterViewControllerInterFace? { get set }
    func viewDidLoad()
   
}
final class FilterViewControllerViewModel {
    var view: FilterViewControllerInterFace?
    lazy var model = [RickanMortyModelResult]()
}

extension FilterViewControllerViewModel:  FilterViewControllerViewModelProtocol {
    func viewDidLoad() {
        view?.prepareViews()
    }
    
}
