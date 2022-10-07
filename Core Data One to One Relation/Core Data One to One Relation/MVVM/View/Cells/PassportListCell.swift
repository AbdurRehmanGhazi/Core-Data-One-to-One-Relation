//
//  PassportListCell.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import UIKit

class PassportListCell: UITableViewCell {

    @IBOutlet weak var passportId: UILabel!
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!

    var passportListModel: PassportListModel! {
        didSet {
            passportId.text = passportListModel.passportId
            employeeName.text = passportListModel.name
            profilePicture.image = UIImage.init(data: passportListModel.profilePicture)
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
    
    class func TableViewCell(tableView: UITableView, indexPath: IndexPath) -> PassportListCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PassportListCell", for: indexPath) as? PassportListCell else { return PassportListCell() }
        return cell
    }
    
}
