//
//  TestTableViewController.swift
//  KavakExample
//
//  Created by Daniel Garcia on 7/19/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    public var arrGnomes: [Gnome] = []
    var imageLoader = ImageLoader()
    
    private var numberOfRows : Int {
        return (self.arrGnomes.count / 2) + (self.arrGnomes.count % 2)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setXibs()
        self.tableView.allowsSelection = false
        self.tableView.bounces = false
        self.tableView.separatorStyle = .none
    }
    
    private func setXibs(){
        tableView.register(UINib(nibName: KVKMosaicCell.identifier, bundle: nil), forCellReuseIdentifier: KVKMosaicCell.identifier)
    }
    
    private func hasRightView(row: Int) -> Bool {
        if row == (numberOfRows - 1) {
            return (self.arrGnomes.count % 2) == 0
        } else {
            return true
        }
    }
    
    private func getImagenFrom(url imageURL: String?) -> UIImage? {
        if let imageURL = imageURL,
           let url = URL(string: imageURL),
           let dataImage = try? Data(contentsOf: url),
           let image = UIImage(data: dataImage) {
            return image
        }
        return nil
    }
    
    private func getJobDescriptionFrom(jobs: [String]?) -> String? {
        guard let arrJobs = jobs, arrJobs.count > 0 else { return nil }
        if arrJobs.count == 1 {
            return "Profession: \(arrJobs.first ?? "")"
        } else {
            if arrJobs.count > 2 {
                return "Professions: \(arrJobs[0]), \(arrJobs[1]), " + "+\(arrJobs.count - 2)"
            } else {
                return "Professions: \(arrJobs[0]), \(arrJobs[1])"
            }
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

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: KVKMosaicCell.identifier) as? KVKMosaicCell {
            let row = indexPath.row * 2
            let leftData = self.arrGnomes[row]
            
            cell.setLeftView(name      : leftData.strName,
                             hairColor : leftData.strHairColor,
                             age       : leftData.iAge,
                             jobs      : getProfessionDescriptionFrom(professions: leftData.arrProfessions),
                             friends   : getFriendsDescriptionFrom(friends: leftData.arrFriends))
            
            imageLoader.obtainImageWithPath(imagePath: leftData.strThumbnail) { (image) in
                cell.leftProfileImageView.image = image
            }
            
            if hasRightView(row: indexPath.row) {
                let rightData = self.arrGnomes[row + 1]
                cell.setRightView(name      : rightData.strName,
                                  hairColor : rightData.strHairColor,
                                  age       : rightData.iAge,
                                  jobs      : getProfessionDescriptionFrom(professions: rightData.arrProfessions),
                                  friends   : getFriendsDescriptionFrom(friends: rightData.arrFriends))
                imageLoader.obtainImageWithPath(imagePath: rightData.strThumbnail) { (image) in
                    cell.rightProfileImageView.image = image
                }
            } else {
                cell.KVKRightView.alpha = 0.0
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width / 2
    }

}


