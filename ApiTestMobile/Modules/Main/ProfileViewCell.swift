//
//  ProfileViewCell.swift
//  ApiTestMobile
//
//  Created by ISAAC DAVID SANTIAGO on 15/09/22.
//

import Foundation
import UIKit

class ProfileViewCell: UICollectionViewCell {
    var user: User?
    
    func profileImg(image: UIImage)  -> UIImageView {
        let img = UIImageView()
        img.image = image
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .white
        
        return img
    }
    
    func descriptionView(user: User) -> UIView {
        let view = UIView()
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        
        let nameText = UILabel()
        nameText.text = "\(user.name!.first!) \(user.name!.last!) "
        nameText.textAlignment = .center
        nameText.textColor = .white
        nameText.numberOfLines = 0
        nameText.lineBreakMode = .byWordWrapping
        nameText.font = UIFont.boldSystemFont(ofSize: 21)
        
        let address = UILabel()
        let addressDesc = UILabel()
        addressDesc.text  = "Address:"
        addressDesc.textColor = .darkGray
        addressDesc.textAlignment = .center
        
        address.text = "\(user.location!.country!) -  \(user.location!.city!)"
        address.textAlignment = .center
        address.numberOfLines = 0
        address.lineBreakMode = .byWordWrapping
        address.textColor = .white
        address.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        let ageDesc = UILabel()
        ageDesc.text = "Age:"
        ageDesc.textAlignment = .center
        ageDesc.textColor = .darkGray
        
        let age = UILabel()
        age.text = "\(user.dob!.age!)"
        age.textColor = .white
        age.font = address.font
        age.textAlignment = .center
        
        let emailDesc = UILabel()
        emailDesc.text = "Email:"
        emailDesc.textAlignment = .center
        emailDesc.textColor = .darkGray
        
        let email = UILabel()
        email.text = user.email
        email.textColor = .white
        email.font = address.font
        email.textAlignment = .center
        
        stackView.addArrangedSubview(nameText)
        stackView.addArrangedSubview(addressDesc)
        stackView.addArrangedSubview(address)
        stackView.addArrangedSubview(ageDesc)
        stackView.addArrangedSubview(age)
        stackView.addArrangedSubview(emailDesc)
        stackView.addArrangedSubview(email)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -5)
        ])
        view.backgroundColor = .lightGray
        print(view.backgroundColor)
        return view
    }
    
    func setupCell(user: User){
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.spacing = 0

        let avatarCharacterImg = profileImg(image: UIImage(data: user.profilePicture!)!)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(avatarCharacterImg)
        
        let descriptionView = descriptionView(user: user)
        stackView.addArrangedSubview(descriptionView)
        stackView.backgroundColor = .white
    
        contentView.addSubview(stackView)
        contentView.backgroundColor = .green
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            descriptionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.65),
            avatarCharacterImg.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.35),
            descriptionView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 1)
        ])
        
    }
}
