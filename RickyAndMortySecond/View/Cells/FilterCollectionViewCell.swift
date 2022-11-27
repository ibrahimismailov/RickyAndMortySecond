//
//  FilterCollectionViewCell.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import UIKit

    class FilterCollectionViewCell: UICollectionViewCell {
        static let identifier = "filterCollectionViewCell"
         let imageContentView: UIView = {
            let view = UIView()
             view.backgroundColor = .systemBackground
             view.layer.cornerRadius = 10
             view.layer.shadowOffset = CGSize(width: 0, height: 2)
             view.layer.shadowRadius = 2
             view.layer.shadowOpacity = 2
             view.layer.shadowColor = UIColor.lightGray.cgColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
         let headerImage: UIImageView = {
            let imageview = UIImageView()
             imageview.contentMode = .scaleAspectFit
            imageview.translatesAutoresizingMaskIntoConstraints = false
            return imageview
        }()
        let subTitle: UILabel = {
           let label = UILabel()
            label.textColor = UIColor(named:"labelsColor")
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 12, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
      
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(imageContentView)
            imageContentView.addSubview(headerImage)
            contentView.addSubview(subTitle)
        }
        override func layoutSubviews() {
            super.layoutSubviews()
           
            NSLayoutConstraint.activate([
                imageContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                imageContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                imageContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                imageContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                
                headerImage.topAnchor.constraint(equalTo: imageContentView.topAnchor, constant: 10),
                headerImage.leadingAnchor.constraint(equalTo: imageContentView.leadingAnchor, constant: 10),
                headerImage.trailingAnchor.constraint(equalTo: imageContentView.trailingAnchor, constant: -10),
                headerImage.bottomAnchor.constraint(equalTo: imageContentView.bottomAnchor, constant: -10),
                
                subTitle.topAnchor.constraint(equalTo: imageContentView.bottomAnchor, constant: -5),
                subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                subTitle.heightAnchor.constraint(equalToConstant: 100)
               
            ])
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
