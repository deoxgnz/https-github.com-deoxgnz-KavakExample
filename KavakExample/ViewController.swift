//
//  ViewController.swift
//  KavakExample
//
//  Created by Daniel Garcia on 7/16/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrGnome = [Gnome]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        //self.view.isUserInteractionEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TestTableViewController {
            destination.arrGnomes = self.arrGnome
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        getGnomesList()
    }
    
    private func getGnomesList(){
        guard let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json") else { return }
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard error == nil else {
                self.showAlert(message: error?.localizedDescription)
                return
            }
            guard let data = data else { return }
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    DispatchQueue.main.async {
                        //print("json: \(json)")
                        if let dctBrastlewark = json["Brastlewark"] as? [[String:Any]] {
                            let gnomes = self.getGnomeArray(dct: dctBrastlewark)
                            print("#gnomes: \(gnomes.count)")
                            //self.arrGnome = [gnomes[0], gnomes[1], gnomes[2]]
                            //self.arrGnome = [gnomes[0], gnomes[1], gnomes[2], gnomes[3], gnomes[4], gnomes[5], gnomes[6]]
                            self.arrGnome = [gnomes[0], gnomes[1], gnomes[2], gnomes[3], gnomes[4], gnomes[5], gnomes[6], gnomes[7], gnomes[8], gnomes[9], gnomes[10], gnomes[11], gnomes[12], gnomes[13], gnomes[14]]
                            self.performSegue(withIdentifier: "segueToGnomeList", sender: self)
                        }
                    }
                }
            } catch let error {
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
    func showAlert(title: String? = "UPS", message: String?, actionTitle: String = "OK", actionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title          : title,
                                      message        : message,
                                      preferredStyle : .alert)
        
        alert.addAction(UIAlertAction(title   : actionTitle,
                                      style   : .default,
                                      handler : actionHandler))
        self.present(alert, animated: true)
    }
    
}

