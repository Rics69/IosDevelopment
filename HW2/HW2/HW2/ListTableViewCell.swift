//
//  ListTableViewCell.swift
//  HW2
//
//  Created by Данил Клементьев on 02.07.2023.
//

import UIKit

struct ListTableViewData{
    let title: String
}

final class ListTableViewCell: UITableViewCell{
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    func setUp(_ data: ListTableViewData){
        titleLabel.text = data.title
    }
}
