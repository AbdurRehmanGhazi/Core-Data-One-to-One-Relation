//
//  UpdateDeleteEmployeeVC.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import UIKit

class UpdateDeleteEmployeeVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passportNoTF: UITextField!
    @IBOutlet weak var passportPlaceOfIssueTF: UITextField!
    @IBOutlet weak var profilePicture: UIImageView!
    
    
    var employeeManager = EmployeeManager()
    var employee: Employee!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapBG(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setEmployeeData()
        employee.displayAllRecords()
    }
    
    @objc func tapBG(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func tapProfilePicture(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tapUpdateButton(_ sender: UIButton) {
        
        if let updatedEmployee: Employee = getDataFromView() {
            
            if employeeManager.udpateEmployee(employee: updatedEmployee) {
                self.navigationController?.popViewController(animated: true)
            }
            else {
                print("Employee not updating...")
            }
        } else {
            print("Fill the form first...")
        }
    }
    
    @IBAction func tapDeleteAll(_ sender: UIButton) {
       
        if employeeManager.deleteEmployee(id: employee.id) {
                self.navigationController?.popViewController(animated: true)
            }
            else {
                print("Employee not deleting...")
            }
    }
    
    func setEmployeeData() {
        nameTF.text = employee.name
        emailTF.text = employee.email
        passportNoTF.text = employee.passport?.passportId
        passportPlaceOfIssueTF.text = employee.passport?.placeOfIssue
        profilePicture.image = UIImage.init(data: employee.profilePicture)
    }
    
    func getDataFromView() -> Employee? {
        
        if nameTF.text!.isEmpty || emailTF.text!.isEmpty || passportNoTF.text!.isEmpty || passportPlaceOfIssueTF.text!.isEmpty || profilePicture.image == getProfileImageTemp() {
            return nil
        }
        let passport = Passport(id: employee.passport!.id, passportId: passportNoTF.text, placeOfIssue: passportPlaceOfIssueTF.text, name: nameTF.text)
        
        let employee = Employee(id: employee.id, name: nameTF.text!, email: emailTF.text!, profilePicture: (profilePicture.image?.pngData())!, passport: passport)
        
        return employee
    }
    
    func getProfileImageTemp() -> UIImage? {
        let homeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 55, weight: .black)
        let homeImage = UIImage(systemName: "person.circle.fill", withConfiguration: homeSymbolConfiguration)
        return homeImage
    }
}

extension UpdateDeleteEmployeeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] {
            profilePicture.image = image as! UIImage
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}

