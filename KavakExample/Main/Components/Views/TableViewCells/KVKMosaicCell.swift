//  KVKMosaicCell.swift
//  Created by Daniel Garcia on 7/19/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import UIKit

class KVKMosaicCell: UITableViewCell {
    
    @IBOutlet weak var KVKLeftView: KVKView!
    @IBOutlet weak var leftProfileImageView: UIImageView!
    @IBOutlet weak var leftNameLbl: KVKLabel!
    @IBOutlet weak var leftJobsLbl: KVKLabel!
    @IBOutlet weak var leftFriendsLbl: KVKLabel!
    @IBOutlet weak var leftHairColorView: KVKView!
    @IBOutlet weak var leftAgeLbl: KVKLabel!
    
    @IBOutlet weak var KVKRightView: KVKView!
    @IBOutlet weak var rightProfileImageView: UIImageView!
    @IBOutlet weak var rightNameLbl: KVKLabel!
    @IBOutlet weak var rightJobsLbl: KVKLabel!
    @IBOutlet weak var rightFriendsLbl: KVKLabel!
    @IBOutlet weak var rightHairColorView: KVKView!
    @IBOutlet weak var rightAgeLbl: KVKLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        KVKRightView.alpha = 0.0
    }

    func setLeftView(name: String, hairColor: String, age: Int, jobs: String, friends: String) {
        leftAgeLbl.text = "\(age) years"
        leftJobsLbl.text = jobs
        leftNameLbl.text = name
        leftFriendsLbl.text = friends
        leftHairColorView.backgroundCode = ColorStyle.colorWith(stringValue: hairColor.lowercased())
    }
    
    func setRightView(name: String, hairColor: String, age: Int, jobs: String, friends: String) {
        KVKRightView.alpha = 1.0
        rightAgeLbl.text = "\(age) years"
        rightJobsLbl.text = jobs
        rightNameLbl.text = name
        rightFriendsLbl.text = friends
        rightHairColorView.backgroundCode = ColorStyle.colorWith(stringValue: hairColor.lowercased())
    }

}
