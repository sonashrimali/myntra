import UIKit

class Home_VC: UIViewController {
    let imagePicker = UIImagePickerController()
    
    // Outlets
    @IBOutlet weak var list_star: UIImageView!
    @IBOutlet weak var shopping_bag: UIImageView!
    @IBOutlet weak var person_fill: UIImageView!
    @IBOutlet weak var magnifying_glass: UIImageView!
    @IBOutlet weak var profileImage: UIImageView! // Renamed 'image' to 'profileImage'
    @IBOutlet weak var main_fill: UIImageView!
    
    @IBOutlet weak var Profile_Details: UILabel!
    @IBOutlet weak var mobile_number: UITextField!
    @IBOutlet weak var Full_name: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var male_female: UISegmentedControl!
    @IBOutlet weak var Birthday: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize person_fill image view
        let imgWidth = person_fill.frame.size.width
        person_fill.layer.cornerRadius = imgWidth / 2
        person_fill.clipsToBounds = true
        person_fill.layer.masksToBounds = true
        person_fill.contentMode = .scaleAspectFill
        person_fill.layer.borderWidth = 2.0
        person_fill.layer.borderColor = UIColor.white.cgColor
        person_fill.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer to person_fill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
        person_fill.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func Act_change(_ sender: UIButton) {
        // Handle mobile number change action
    }
    
    @IBAction func deleteAccount(_ sender: UIButton) {
        // Handle delete account action
        let alert = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            // Add delete account logic here
        }))
        present(alert, animated: true, completion: nil)
    }
    // Additional setup...
    
    @IBAction func saveDetails(_ sender: UIButton) {
        // Handle save details action
        if validateInputs() {
            // Save details logic here
            let alert = UIAlertController(title: "Success", message: "Details saved successfully!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                // Navigate to ViewController and pass data
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Saved_details_VC") as? Saved_details_VC {
                    viewController.Fullname = self.Full_name.text ?? ""
                    viewController.email = self.Email.text ?? ""
                    viewController.gender = self.male_female.titleForSegment(at: self.male_female.selectedSegmentIndex) ?? ""
                    viewController.mobileNumber = self.mobile_number.text ?? ""
                    viewController.birthday = self.Birthday.text ?? ""
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func validateInputs() -> Bool {
        // Validate inputs
        guard let mobile = mobile_number.text, !mobile.isEmpty else {
            showAlert(message: "Please enter your mobile number")
            return false
        }
        
        // Validate mobile number format (exactly 10 digits)
        let mobileRegex = "^\\d{10}$"
        let mobilePredicate = NSPredicate(format: "SELF MATCHES %@", mobileRegex)
        guard mobilePredicate.evaluate(with: mobile) else {
            showAlert(message: "Please enter a valid 10-digit mobile number")
            return false
        }
        
        guard let fullname = Full_name.text, !fullname.isEmpty else {
            showAlert(message: "Please enter your full name")
            return false
        }
        
        guard let email = Email.text, !email.isEmpty, isValidEmail(email) else {
            showAlert(message: "Please enter a valid email")
            return false
        }
        
        guard let birthday = Birthday.text, !birthday.isEmpty else {
            showAlert(message: "Please enter your birthday.")
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Basic email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            // Handle alert OK action if needed
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func imgTapped() {
        // Handle tap on person_fill image view
    }
}


