//
//  FilmTableHeaderView.swift
//  tvAndSerial
//
//  Created by Ios Dev on 04/09/2018.
//  Copyright © 2018 Anton Chugunov. All rights reserved.
//

import UIKit

class FilmTableHeaderView: UIView {
    var titleString: String? {
        didSet {
            titleLabel.text = titleString
        }
    }
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .orange
        lbl.backgroundColor = .clear
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.lineBreakMode = .byTruncatingTail
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let moreButton : UIButton = {
        let btn = UIButton(type: .custom)
        let image = UIImage(named: "more")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.tintColor = UIColor.orange
        btn.setTitle("Еще", for: .normal)
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        return btn
    }()
    
    private let completeHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        completeHeaderView.translatesAutoresizingMaskIntoConstraints = false
        completeHeaderView.addSubview(titleLabel)
        completeHeaderView.addSubview(moreButton)
        addSubview(completeHeaderView)
        backgroundColor = UIColor.black
        let views:[String:UIView] = ["titleLabel": titleLabel, "moreButton": moreButton, "completeHeaderView": completeHeaderView]
        var constraints = [NSLayoutConstraint]()
        constraints += [NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: completeHeaderView, attribute: .width, multiplier: 1, constant: 0),
                        NSLayoutConstraint(item: completeHeaderView, attribute: .trailing, relatedBy: .equal, toItem: moreButton, attribute: .trailing, multiplier: 1, constant: 10)]
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[completeHeaderView]-0-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[titleLabel]-(>=50)-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[titleLabel(20)]-5-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[moreButton(20)]-5-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
