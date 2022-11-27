//
//  ReusableApplyButton.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import UIKit
class ReusableApplyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    func setupButton(){
        layer.borderWidth = 0.1
        layer.cornerRadius = 10
        backgroundColor = .systemBlue
        layer.shadowRadius = 0.7
        layer.shadowOpacity = 0.7
        setTitle("Apply", for: .normal)
        setTitleColor(.white, for: .normal)
        layer.shadowOffset = CGSize(width: 0.6, height: 0.5)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//extension UIButton {
//    func makeReusableButton () {
//
//    }
//}
