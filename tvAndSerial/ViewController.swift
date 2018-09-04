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
        FilmCompany(name: "Амедиатека", films: [Film(name: "Гоголь. Страшная месть", imageName: "gogol", year: 2018), Film(name: "Альфа", imageName: "alpha", year: 2018), Film(name: "Мег: Монстр глубины", imageName: "meg", year: 2018), Film(name: "Как женить толстяка", imageName: "tolstyak", year: 2018), Film(name: "Кин", imageName: "kin", year: 2018), Film(name: "Аксель", imageName: "axel", year: 2018)]),
        FilmCompany(name: "Megogo", films: [Film(name: "Как женить толстяка", imageName: "tolstyak", year: 2018),Film(name: "Тёмные отражения", imageName: "dark", year: 2018), Film(name: "Монстры на каникулах", imageName: "monsters", year: 2018), Film(name: "Кин", imageName: "kin", year: 2018), Film(name: "Аксель", imageName: "axel", year: 2018)]),
        FilmCompany(name: "Амедиатека", films: [Film(name: "Гоголь. Страшная месть", imageName: "gogol", year: 2018), Film(name: "Альфа", imageName: "alpha", year: 2018), Film(name: "Мег: Монстр глубины", imageName: "meg", year: 2018),  Film(name: "Кин", imageName: "kin", year: 2018), Film(name: "Аксель", imageName: "axel", year: 2018)])
    ]
    
    
    @IBOutlet var filmsTableView:UITableView!
    let tableCellIdentifier = "tableCellIdentifier"
    let collectionCellIdentifier = "collectionCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topBar = TopBarItem(frame: CGRect(x: 0, y: 0, width: 140, height: 64))
        topBar.titleString = "Фильмы"
        topBar.barStyle = .black
        
        self.filmsTableView = UITableView()
        self.filmsTableView.backgroundColor = UIColor.black
        
        let bottomBar = UITabBar()
        bottomBar.barStyle = .black
        bottomBar.items = [
            UITabBarItem(title: "Видео", image: UIImage(named: "video"), selectedImage: UIImage(named: "video")),
            UITabBarItem(title: "ТВ", image: UIImage(named: "tv"), selectedImage: UIImage(named: "tv")),
            UITabBarItem(title: "Настройки", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
        ]
        bottomBar.tintColor = UIColor.orange
        bottomBar.selectedItem = bottomBar.items?.first
        
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
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[topBar(64)]-0-[tableView]-[bottomBar(44)]-0-|", options: [], metrics: nil, views: viewsDictionary)
        viewConstraints += verticalConstraints
        NSLayoutConstraint.activate(viewConstraints)
        
        filmsTableView.separatorStyle = .none
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
        return 315
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = FilmTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 30))
        headerView.titleString = filmsData[section].name
        return headerView
    }
}

extension ViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return filmsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! FilmsTableViewCell
        cell.filmCompany = self.filmsData[indexPath.section]
        return cell
    }
}



