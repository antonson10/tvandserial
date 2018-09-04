//
//  FilmCollectionViewCell.swift
//  tvAndSerial
//
//  Created by Anton Chugunov on 04.09.2018.
//  Copyright © 2018 Anton Chugunov. All rights reserved.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {
    var film: Film? {
        didSet {
            imageView.image = UIImage(named: film!.imageName)
            nameLabel.text = film?.name
            yearLabel.text = "\(film!.year)"
        }
    }
    private let imageView:UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        iv.contentMode = UIViewContentMode.scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.backgroundColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byTruncatingTail
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let yearLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(displayP3Red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        lbl.backgroundColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byTruncatingTail
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(yearLabel)
        let views:[String:UIView] = ["imageView": imageView, "nameLabel":  nameLabel,"yearLabel": yearLabel]
        var constraints = [NSLayoutConstraint]()
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[imageView(150)]-[nameLabel(40)]-[yearLabel(20)]-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[imageView]-5-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[nameLabel]-5-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[yearLabel]-5-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
