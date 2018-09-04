//
//  TopBarItem.swift
//  tvAndSerial
//
//  Created by Anton Chugunov on 04/09/2018.
//  Copyright © 2018 Anton Chugunov. All rights reserved.
//

import UIKit

class TopBarItem: UIToolbar {
    var titleString: String? {
        didSet {
            titleLabel.text = titleString
        }
    }
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .orange
        lbl.backgroundColor = .clear
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.lineBreakMode = .byTruncatingTail
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let searchButton : UIButton = {
        let btn = UIButton(type: .custom)
        let image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.tintColor = UIColor.orange
        return btn
    }()
    
    
    
    private let completeToolbarView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 26))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        completeToolbarView.translatesAutoresizingMaskIntoConstraints = false
        completeToolbarView.addSubview(titleLabel)
        completeToolbarView.addSubview(searchButton)
        addSubview(completeToolbarView)
        let views:[String:UIView] = ["titleLabel": titleLabel, "searchButton": searchButton, "completeToolbarView": completeToolbarView]
        var constraints = [NSLayoutConstraint]()
        constraints += [NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: completeToolbarView, attribute: .width, multiplier: 1, constant: 0),
                        NSLayoutConstraint(item: completeToolbarView, attribute: .centerXWithinMargins, relatedBy: NSLayoutRelation(rawValue: 0)!, toItem: titleLabel, attribute: .centerXWithinMargins, multiplier: 1, constant: 0),
                        NSLayoutConstraint(item: completeToolbarView, attribute: .trailing, relatedBy: .equal, toItem: searchButton, attribute: .trailing, multiplier: 1, constant: 5)]
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[completeToolbarView]-0-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-38-[titleLabel(26)]-0-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-38-[searchButton(26)]-0-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
