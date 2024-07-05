//
//  Saved_details_VC.swift
//  myntra
//
//  Created by APPLE SERVER on 29/06/24.
//

import UIKit

class Saved_details_VC: UIViewController {

    
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var Full_name: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var select_gender: UILabel!
    @IBOutlet weak var Birthday: UILabel!
    @IBOutlet weak var mobile_number: UILabel!
    
    // Variables to store the user's data
    var Fullname: String = ""
    var mobileNumber: String = ""
    var email: String = ""
    var gender: String = ""
    var birthday: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the labels with the user's data
        Full_name.text = Fullname
        Email.text = email
        select_gender.text = gender
        mobile_number.text = mobileNumber
        Birthday.text = birthday
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Goback(_ sender: UIButton) {
        // Dismiss or pop the view controller depending on presentation style
        if presentingViewController != nil {
            // Presented modally
            dismiss(animated: true, completion: nil)
        } else if navigationController != nil {
            // Pushed onto navigation stack
            navigationController?.popViewController(animated: true)
        } else {
            // Handle other cases if necessary
        }
    }
}
