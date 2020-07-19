//  KVKMosaicCell.swift
//  Created by Daniel Garcia on 7/19/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import UIKit

class KVKMosaicCell: UITableViewCell {
    
    @IBOutlet weak var KVKLeftView: KVKView!
    @IBOutlet weak var leftProfileImageView: UIImageView!
    @IBOutlet weak var leftNameLbl: KVKLabel!
    @IBOutlet weak var leftHairColorView: KVKView!
    @IBOutlet weak var leftAgeLbl: KVKLabel!
    
    @IBOutlet weak var KVKRightView: KVKView!
    @IBOutlet weak var rightProfileImageView: UIImageView!
    @IBOutlet weak var rightNameLbl: KVKLabel!
    @IBOutlet weak var rightHairColorView: KVKView!
    @IBOutlet weak var rightAgeLbl: KVKLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        KVKRightView.alpha = 0.0
    }

    func setLeftView(name: String, hairColor: String, age: Int, image: UIImage? = nil) {
        leftAgeLbl.text = "\(age) years old"
        leftNameLbl.text = name
        leftHairColorView.backgroundCode = ColorStyle.colorWith(stringValue: hairColor.lowercased())
        if let uiImage = image { leftProfileImageView.image = uiImage }
    }
    
    func setRightView(name: String, hairColor: String, age: Int, image: UIImage? = nil) {
        KVKRightView.alpha = 1.0
        rightAgeLbl.text = "\(age) years old"
        rightNameLbl.text = name
        rightHairColorView.backgroundCode = ColorStyle.colorWith(stringValue: hairColor.lowercased())
        if let uiImage = image { rightProfileImageView.image = uiImage }
    }

}
