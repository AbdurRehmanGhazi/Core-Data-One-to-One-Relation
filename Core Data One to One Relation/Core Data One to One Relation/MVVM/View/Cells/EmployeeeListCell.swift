//
//  EmployeeeListCell.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import UIKit

class EmployeeeListCell: UITableViewCell {
    
    @IBOutlet weak var profilePictuer: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!

    var employeeListModel: EmployeeListModel! {
        didSet {
            profilePictuer.image = UIImage(data: employeeListModel.profilePicture)
            name.text = employeeListModel.name
            email.text = employeeListModel.email
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func TableViewCell(tableView: UITableView, indexPath: IndexPath) -> EmployeeeListCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeeListCell", for: indexPath) as? EmployeeeListCell else { return EmployeeeListCell() }
        return cell
    }
    
}
