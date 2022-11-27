//
//  FilterViewController.swift
//  RickyAndMortySecond
//
//  Created by Abraam on 27.11.2022.
//

import UIKit
import SDWebImage
protocol FilterViewControllerInterFace {
    func prepareViews()

}
class FilterViewController: UIViewController {
    private lazy var viewModel = FilterViewControllerViewModel()
    private lazy var genderTextField = ReusableTextfield()
    private lazy var statusTextField = ReusableTextfield()
    private lazy var applyButton = ReusableApplyButton()
    private lazy var genderTableView = ReusableTableView()
    private lazy var statusTableView = ReusableTableView()
    var models = [RickanMortyModelResult]()
    private lazy var genderText = ["male","female","genderless","unknown"]
    private lazy var statusText = ["alive", "dead","unknown"]
    private let collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.minimumLineSpacing = 70
          layout.minimumInteritemSpacing = 1
          layout.scrollDirection = .vertical
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
          collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
          collectionView.contentInset = UIEdgeInsets(top: 40, left: 5, bottom: 40, right: 5 )
          return collectionView
      }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}
    //MARK: - FilterViewControllerInterFace

extension FilterViewController: FilterViewControllerInterFace {

    
    func prepareViews() {
        title = "Filter"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubview(genderTextField)
        view.addSubview(statusTextField)
        view.addSubview(applyButton)
        view.addSubview(genderTableView)
        view.addSubview(statusTableView)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        genderTextField.delegate = self
        statusTextField.delegate = self
        genderTextField.placeholder = " Gender"
        statusTextField.placeholder = " Status"
        genderTableView.tag = 1
        statusTableView.tag = 2
        applyButton.addTarget(self, action: #selector(tappedApplyButton), for: .touchUpInside)
    }
    @objc private func tappedApplyButton() {
        
       if  let gender = genderTextField.text,
           let status = statusTextField.text {
         
           RickanMortyService.shared.getFilteredCharacter(gender: gender, status: status) {[weak self] result in
               switch result {
               case .success(let success):
                   self?.models = success
                   DispatchQueue.main.async {
                       self?.collectionView.isHidden = false
                       self?.collectionView.reloadData()
                       self?.genderTextField.text = ""
                       self?.statusTextField.text = ""

                   }
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
       }
        
    }
}
    //MARK: - UITextFieldDelegate
extension FilterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == genderTextField {
            genderTableView.setupTableView(tablevieww: self.genderTableView, view: self.view)
            genderTableView.delegate = self
            genderTableView.dataSource = self
            genderTableView.animateTableView(tableVieww: self.genderTableView, tag: 1, view: self.view, load: true)
            view.endEditing(false)
        }
        if textField == statusTextField {
            statusTableView.setupTableView(tablevieww: self.statusTableView, view: self.view)
            statusTableView.delegate = self
            statusTableView.dataSource = self
            statusTableView.animateTableView(tableVieww: self.statusTableView, tag: 2, view: self.view, load: true)
            view.endEditing(false)
        }
    }
}
extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1: return genderText.count
        case 2: return statusText.count
        default:
            break
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
            cell.textLabel?.text = genderText[indexPath.row]
            cell.backgroundColor = .systemGray6
              return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
            cell.textLabel?.text = statusText[indexPath.row]
            cell.backgroundColor = .systemGray6
              return cell
        default:
            break
        }
return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch tableView.tag {
        case 1:
            genderTableView.animateTableView(tableVieww: self.genderTableView, tag: 1, view: self.view, load: false)
            genderTextField.text = genderText[indexPath.row]
          
        case 2:statusTableView.animateTableView(tableVieww: self.statusTableView, tag: 2, view: self.view, load: false)
            statusTextField.text = statusText[indexPath.row]
           
        default:
            break
        }
    }
    
}
    //MARK: - FilterViewController + Constraints
extension FilterViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            genderTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            genderTextField.heightAnchor.constraint(equalToConstant: 48),
            
            statusTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            statusTextField.heightAnchor.constraint(equalToConstant: 48),
            
            applyButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 10),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyButton.heightAnchor.constraint(equalToConstant: 48),
            
            collectionView.topAnchor.constraint(equalTo: applyButton.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
extension FilterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as? FilterCollectionViewCell else {
            return UICollectionViewCell()
        }
        let image = models[indexPath.row].image ?? ""
        let title = models[indexPath.row].name
             cell.subTitle.text = title
             cell.headerImage.sd_setImage(with: URL(string: image))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (view.frame.size.width/3)-4, height: (view.frame.size.width/3)-4)
        }




}
