//
//  ReusableTextfield.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import UIKit
class ReusableTextfield: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    func setupTextField(){
        layer.borderWidth = 0.1
        layer.cornerRadius = 10
        setupOverViewRightView(textField: self, imageViewNamed: "chevron.down")
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func setupOverViewRightView(textField: UITextField, imageViewNamed: String) {
    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 18, height: 16))
    imageView.image = UIImage(systemName: "chevron.down")
    let imageViewConteinerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
    imageViewConteinerView.addSubview(imageView)
    textField.rightView =  imageViewConteinerView
    textField.rightView?.tintColor  = UIColor(red: 0.634, green: 0.634, blue: 0.634, alpha: 1)
    textField.rightViewMode = .always
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 5,
        left: 16,
        bottom: 5,
        right: 20
    )
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
