//
//  ViewController.swift
//  tvAndSerial
//
//  Created by Anton Chugunov on 02.09.2018.
//  Copyright © 2018 Anton Chugunov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var filmsData:[FilmCompany] = [
        FilmCompany(name: "Амедиатека", films: [Film(name: "Гоголь. Страшная месть", imageName: "gogol", year: 2018), Film(name: "Альфа", imageName: "alpha", year: 2018), Film(name: "Мег: Монстр глубины", imageName: "meg", year: 2018), Film(name: "Как женить толстяка", imageName: "tolstyak", year: 2018)]),
        FilmCompany(name: "Megogo", films: [Film(name: "Тёмные отражения", imageName: "dark", year: 2018), Film(name: "Монстры на каникулах", imageName: "monsters", year: 2018), Film(name: "Кин", imageName: "kin", year: 2018), Film(name: "Аксель", imageName: "axel", year: 2018)])
    ]
    
    
    @IBOutlet var filmsTableView:UITableView!
    let tableCellIdentifier = "tableCellIdentifier"
    let collectionCellIdentifier = "collectionCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        let topBar = UINavigationBar()
        self.filmsTableView = UITableView()
        let bottomBar = UITabBar()
        
        //tableView.backgroundColor = UIColor.black
        //topBar.backgroundColor = UIColor(displayP3Red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
        topBar.backgroundColor = UIColor.yellow
        //bottomBar.backgroundColor = UIColor(displayP3Red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
        //bottomBar.tintColor = UIColor.brown
        bottomBar.barStyle = .black
        
        filmsTableView.translatesAutoresizingMaskIntoConstraints = false
        topBar.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(topBar)
        self.view.addSubview(filmsTableView)
        self.view.addSubview(bottomBar)
        
        let viewsDictionary = ["topBar": topBar,
                         "tableView": filmsTableView ,
                         "bottomBar": bottomBar];
        
        //build array to store constraints
        var viewConstraints = [NSLayoutConstraint]()
        
        let topBarHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[topBar]-0-|", options: [], metrics: nil, views: viewsDictionary)
        viewConstraints += topBarHorizontalConstraints
        let tablewViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: [], metrics: nil, views: viewsDictionary)
        viewConstraints += tablewViewHorizontalConstraints
        let bottomBarHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[bottomBar]-0-|", options: [], metrics: nil, views: viewsDictionary)
        viewConstraints += bottomBarHorizontalConstraints
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[topBar(44)]-0-[tableView]-[bottomBar(==topBar)]-0-|", options: [], metrics: nil, views: viewsDictionary)
        viewConstraints += verticalConstraints
        NSLayoutConstraint.activate(viewConstraints)
        
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.register(FilmsTableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! FilmsTableViewCell
        cell.filmCompany = self.filmsData[indexPath.row]
        return cell
    }
}



