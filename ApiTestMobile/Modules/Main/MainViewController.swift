//
//  MainViewController.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//  
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterMainProtocol?
    
    var titleTextView:UILabel = {
        let textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 40)
        textView.text = "USERS TEST API"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.textAlignment = .center
        return textView
    }()
    
    var tableUsers: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: 350, height: 170)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
       
        let table = UICollectionView(frame: .zero, collectionViewLayout: layout)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .gray
        return table
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter?.loadCharacteres(successRes: {
            self.tableUsers.reloadData()
        }, failureRes: {
            
        })
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleTextView)
        
        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            titleTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextView.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleTextView.heightAnchor.constraint(equalToConstant: 62)
        ])
        
        tableUsers.dataSource = self
        tableUsers.delegate = self
        tableUsers.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        tableUsers.register(ProfileViewCell.self, forCellWithReuseIdentifier: "profilecell")

        view.addSubview(tableUsers)
        
        NSLayoutConstraint.activate([
            tableUsers.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 20),
            tableUsers.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableUsers.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableUsers.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.82)
        ])
        
    
    }

    
}

extension MainViewController: PresenterToViewMainProtocol{
    // TODO: Implement View Output Methods
}

extension MainViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected: \(presenter?.usersLocal?[indexPath.row])")
    }
}

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let users = presenter?.usersLocal{
            return  users.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profilecell", for: indexPath) as? ProfileViewCell{
            cell.setupCell(user: (presenter?.usersLocal?[indexPath.item])!)
            return cell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
}
