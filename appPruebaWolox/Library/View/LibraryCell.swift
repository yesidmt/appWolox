//
//  LibraryCell.swift
//  appPruebaWolox
//
//  Created by Yesid Mendoza Trujillo on 16/06/21.
//

import Foundation
import UIKit
class ListLibraryCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var imageLibrary: UIImageView!
    @IBOutlet weak var imgBackContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgBackContent.layer.cornerRadius = 7
        self.contentView.layer.cornerRadius = 0.5
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.contentView.layer.shadowRadius = 7.0
        self.contentView.layer.shadowOpacity = 0.5
        
    }
    
}
