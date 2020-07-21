//  ViewController.swift
//  Created by Daniel Garcia on 7/16/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var srcBar: UISearchBar!
    @IBOutlet weak var gnomeTbl: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //MARK: - Private var
    private var isSearch: Bool = false
    private var arrGnomes = [Gnome]()
    private var arrFilterGnomes = [Gnome]()
    private var imageLoader = ImageLoader()
    
    private var numberOfRows : Int {
        return isSearch ? (self.arrFilterGnomes.count / 2) + (self.arrFilterGnomes.count % 2) : (self.arrGnomes.count / 2) + (self.arrGnomes.count % 2)
    }
    
    //MARK: - Cycle Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        getGnomeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Private Funcs
    private func setViews(){
        setXibs()
        srcBar.delegate = self
        gnomeTbl.delegate = self
        gnomeTbl.dataSource = self
        gnomeTbl.allowsSelection = false
        gnomeTbl.bounces = false
        gnomeTbl.separatorStyle = .none
    }
    private func setXibs(){
        gnomeTbl.register(UINib(nibName: KVKMosaicCell.identifier, bundle: nil), forCellReuseIdentifier: KVKMosaicCell.identifier)
    }
    
    //MARK: - Indicator Funcs
    private func startIndicator(){
        self.view.isUserInteractionEnabled = false
        self.gnomeTbl.isHidden = true
        self.indicator.startAnimating()
    }
    private func stopIndicator(){
        self.view.isUserInteractionEnabled = true
        self.gnomeTbl.isHidden = false
        self.indicator.stopAnimating()
        self.indicator.isHidden = true
    }
    
    //MARK: - Gnome Funcs
    private func getGnomeData(){
        startIndicator()
        getGnomesList()
    }
    
    private func getGnomesList(){
        guard let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json") else { return }
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard error == nil else {
                self.stopIndicator()
                self.showAlert(message: error?.localizedDescription)
                return
            }
            guard let data = data else { self.stopIndicator(); return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    DispatchQueue.main.async {
                        if let dctBrastlewark = json["Brastlewark"] as? [[String:Any]] {
                            self.arrGnomes = self.getGnomeArray(dct: dctBrastlewark)
                            self.stopIndicator()
                            self.gnomeTbl.reloadData()
//                            self.performSegue(withIdentifier: "segueToGnomeList", sender: self)
                        }
                    }
                }
            } catch let error {
                self.stopIndicator()
                self.showAlert(message: error.localizedDescription)
            }
        }.resume()
    }
    
    private func getGnomeArray(dct: [[String: Any]]) -> [Gnome] {
        var gnomes = [Gnome]()
        for element in dct {
            gnomes.append(setGnome(dct: element))
        }
        return gnomes
    }
    
    private func hasRightView(row: Int) -> Bool {
        if row == (numberOfRows - 1) {
            return isSearch ? ( (self.arrFilterGnomes.count % 2) == 0 ) : ( (self.arrGnomes.count % 2) == 0 )
        } else {
            return true
        }
    }
    
    private func getProfessionDescriptionFrom(professions: [String]?) -> String {
        guard let arrprofessions = professions, arrprofessions.count > 0 else { return "Professions: N/A" }
        return arrprofessions.count > 1 ? "Professions: \(arrprofessions[0]), " + "+\(arrprofessions.count - 1)" : "Profession: \(arrprofessions.first ?? "")"
    }
    
    private func getFriendsDescriptionFrom(friends: [String]?) -> String {
        guard let arrFriends = friends, arrFriends.count > 0 else { return "Friends: N/A" }
        return arrFriends.count > 1 ? "Friends: \(arrFriends[0]), " + "+\(arrFriends.count - 1)" : "Friend: \(arrFriends.first ?? "")"
    }
    
    private func setGnome(dct: [String: Any]) -> Gnome {
        var gnome = Gnome()
        
        if let id = dct["id"] as? Int {
            gnome.iId = id
        }
        if let age = dct["age"] as? Int {
            gnome.iAge = age
        }
        if let weight = dct["weight"] as? Double {
            gnome.dWeight = weight
        }
        if let height = dct["height"] as? Double {
            gnome.dHeight = height
        }
        if let name = dct["name"] as? String {
            gnome.strName = name
        }
        if let hair = dct["hair_color"] as? String {
            gnome.strHairColor = hair
        }
        if let thumbnail = dct["thumbnail"] as? String {
            gnome.strThumbnail = thumbnail
        }
        if let friends = dct["friends"] as? [String] {
            gnome.arrFriends = friends.map { $0.trimmingCharacters(in: .whitespaces).capitalized }
        }
        if let professions = dct["professions"] as? [String] {
            gnome.arrProfessions = professions.map { $0.trimmingCharacters(in: .whitespaces) }
        }
        
        return gnome
    }
    //MARK: - @objc funcs
    @objc func showDetail(_ sender: Any?){
        if let gesture = sender as? UITapGestureRecognizer,
           let KVKView = gesture.view as? KVKView {
            print("tag: \(KVKView.tag)")
            let detailVC = GnomeDetailViewController()
            let gnome = isSearch ? arrFilterGnomes[KVKView.tag] : arrGnomes[KVKView.tag]
            detailVC.gnome = gnome
            if let imagePath = gnome.strThumbnail,
               let image = self.imageLoader.cache.object(forKey: imagePath as NSString) {
                detailVC.gnomeImage = image
            }
            detailVC.modalPresentationStyle = .popover
            present(detailVC, animated: true)
        }
    }
    
    //MARK: - Other Funcs
    func showAlert(title: String? = "UPS!!", message: String?, actionTitle: String = "OK", actionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title          : title,
                                      message        : message,
                                      preferredStyle : .alert)
        
        alert.addAction(UIAlertAction(title   : actionTitle,
                                      style   : .default,
                                      handler : actionHandler))
        self.present(alert, animated: true)
    }
}
//MARK: - Extension UITableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return numberOfRows }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return UIScreen.main.bounds.width / 2 }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KVKMosaicCell.identifier) as? KVKMosaicCell
        else { return UITableViewCell() }
        
        let row = indexPath.row * 2
        let leftData = isSearch ? self.arrFilterGnomes[row] : self.arrGnomes[row]
        
        cell.setLeftView(name      : leftData.strName,
                         hairColor : leftData.strHairColor,
                         age       : leftData.iAge,
                         jobs      : getProfessionDescriptionFrom(professions: leftData.arrProfessions),
                         friends   : getFriendsDescriptionFrom(friends: leftData.arrFriends))
        
        imageLoader.obtainImageWithPath(imagePath: leftData.strThumbnail) { (image) in
            cell.leftProfileImageView.image = image
        }
        
        cell.KVKLeftView.tag = row
        cell.KVKLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDetail(_:))))
        
        if hasRightView(row: indexPath.row) {
            let rightData = isSearch ? self.arrFilterGnomes[row + 1] : self.arrGnomes[row + 1]
            cell.setRightView(name      : rightData.strName,
                              hairColor : rightData.strHairColor,
                              age       : rightData.iAge,
                              jobs      : getProfessionDescriptionFrom(professions: rightData.arrProfessions),
                              friends   : getFriendsDescriptionFrom(friends: rightData.arrFriends))
            imageLoader.obtainImageWithPath(imagePath: rightData.strThumbnail) { (image) in
                cell.rightProfileImageView.image = image
            }
            cell.KVKRightView.tag = row + 1
            cell.KVKRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDetail(_:))))
        } else {
            cell.KVKRightView.alpha = 0.0
        }
        return cell
    }
}
//MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        arrFilterGnomes = arrGnomes
        isSearch = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        arrFilterGnomes = []
        isSearch = false
        self.gnomeTbl.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if text != "" {
            arrFilterGnomes = arrGnomes.filter({ (object) -> Bool in
                object.strName.range(of: text, options: [.diacriticInsensitive, .caseInsensitive]) != nil
            })
        } else {
            arrFilterGnomes = arrGnomes
        }
        self.gnomeTbl.reloadData()
    }
}
//MARK: - UITableViewCell
extension UITableViewCell {
    class var identifier: String { return String(describing: self) }
}
