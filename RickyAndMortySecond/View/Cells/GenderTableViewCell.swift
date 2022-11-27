//
//  GenderTableViewCell.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import Foundation
import UIKit
class GenderTableViewCell: UITableViewCell {
static let identifier = "SecondTableViewCell"

    
    let countryLabel: UILabel = {
       let label = UILabel()
       label.font = .systemFont(ofSize: 18, weight: .regular)
       label.textColor = UIColor(named: "labelsColor")
       label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
       return label
   }()
    let countryImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
   }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        contentView.addSubview(countryLabel)
        contentView.addSubview(countryImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            countryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            countryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            countryImage.heightAnchor.constraint(equalToConstant: 30),
            countryImage.widthAnchor.constraint(equalToConstant: 30),
           
           
        ])
    }
    
}
