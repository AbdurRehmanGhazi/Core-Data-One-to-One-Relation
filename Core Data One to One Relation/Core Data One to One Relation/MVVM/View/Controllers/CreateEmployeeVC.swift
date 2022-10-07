//
//  CreateEmployeeVC.swift
//  Core Data One to One Relation
//
//  Created by AbdurRehmanNineSol on 07/10/2022.
//

import UIKit

class CreateEmployeeVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passportNoTF: UITextField!
    @IBOutlet weak var passportPlaceOfIssueTF: UITextField!
    @IBOutlet weak var profilePicture: UIImageView!
    
    
    var employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapBG(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)

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
    
    @IBAction func tapCreateButton(_ sender: UIButton) {
        
        if let employee: Employee = getDataFromView() {
        employeeManager.createEmployee(employee: employee)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.tapClearAll(UIButton())
                self.tabBarController?.selectedIndex = 1
            }
        } else {
            print("Fill the form first...")
        }
    }

    @IBAction func tapClearAll(_ sender: UIButton) {
        
        nameTF.text = ""
        emailTF.text = ""
        passportNoTF.text = ""
        passportPlaceOfIssueTF.text = ""
        profilePicture.image = getProfileImageTemp()
    }
    
    func getDataFromView() -> Employee? {
        
        if nameTF.text!.isEmpty || emailTF.text!.isEmpty || passportNoTF.text!.isEmpty || passportPlaceOfIssueTF.text!.isEmpty || profilePicture.image == getProfileImageTemp() {
            return nil
        }
        let passport = Passport(id: UUID(), passportId: passportNoTF.text, placeOfIssue: passportPlaceOfIssueTF.text, name: nameTF.text)
        
        let employee = Employee(id: UUID(), name: nameTF.text!, email: emailTF.text!, profilePicture: (profilePicture.image?.pngData())!, passport: passport)
        
        return employee
    }

    func getProfileImageTemp() -> UIImage? {
        let homeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 55, weight: .black)
        let homeImage = UIImage(systemName: "person.circle.fill", withConfiguration: homeSymbolConfiguration)
        return homeImage
    }
}

extension CreateEmployeeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] {
            profilePicture.image = image as! UIImage
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
