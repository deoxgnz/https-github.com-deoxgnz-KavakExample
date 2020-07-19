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
            
            cell.setLeftView(name: leftData.strName, hairColor: leftData.strHairColor, age: leftData.iAge)
            
            if hasRightView(row: indexPath.row) {
                let rightData = self.arrGnomes[row + 1]
                cell.setRightView(name: rightData.strName, hairColor: rightData.strHairColor, age: rightData.iAge)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = (UIScreen.main.bounds.width - 36) / 2
        print("\n\nsize: \(size)\n\n")
        return size
    }

}

extension UITableViewCell {
    class var identifier: String { return String(describing: self) }
}
