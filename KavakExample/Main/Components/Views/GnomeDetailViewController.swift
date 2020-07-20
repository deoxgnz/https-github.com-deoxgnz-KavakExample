//  GnomeDetailViewController.swift
//  Created by Daniel Garcia on 7/20/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import UIKit

class GnomeDetailViewController: UIViewController {
    
    public var gnome: Gnome?
    public var gnomeImage: UIImage?
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: KVKLabel!
    
    @IBOutlet weak var heightLbl: KVKLabel!
    @IBOutlet weak var weightLbl: KVKLabel!
    @IBOutlet weak var ageLbl: KVKLabel!
    @IBOutlet weak var hairColorView: KVKView!
    @IBOutlet weak var hairColorLbl: KVKLabel!
    @IBOutlet weak var professionLbl: KVKLabel!
    @IBOutlet weak var friendsLbl: KVKLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGnomeData()
    }


    func setGnomeData(){
        if let image = self.gnomeImage {
            self.profileImg.image = image
        }
        ageLbl.text                  = "\(gnome?.iAge ?? 0)"
        nameLbl.text                 = gnome?.strName
        heightLbl.text               = "\(String(format: "%.2f", gnome?.dHeight ?? 0.0)) cm."
        weightLbl.text               = "\(String(format: "%.2f", gnome?.dWeight ?? 0.0)) kg."
        friendsLbl.text              = getFriendList(friends: gnome?.arrFriends)
        hairColorLbl.text            = "(\(gnome?.strHairColor ?? ""))"
        professionLbl.text           = getProfessionList(professions: gnome?.arrProfessions)
        hairColorView.backgroundCode = ColorStyle.colorWith(stringValue: gnome?.strHairColor.lowercased() ?? "gnomebg")
    }
    
    func getProfessionList(professions: [String]?) -> String {
        guard let arrProfessions = professions, arrProfessions.count > 0 else { return "N/A" }
        var professions = ""
        for (i,element) in arrProfessions.enumerated(){
            if i == arrProfessions.count - 1 {
                professions += element
            } else {
                professions += "\(element)\n"
            }
        }
        return professions
    }
    
    func getFriendList(friends: [String]?) -> String {
        guard let arrFriends = friends, arrFriends.count > 0 else { return "N/A" }
        var friends = ""
        for (i,element) in arrFriends.enumerated(){
            if i == arrFriends.count - 1 {
                friends += element
            } else {
                friends += "\(element)\n"
            }
        }
        return friends
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
