import UIKit

class Reset_VC: UIViewController {

    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var resetPassword: UILabel!
    @IBOutlet weak var myntra: UIImageView!
    
    private let correctOldPassword = "s9664"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func act_goback(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Act_login(_ sender: UIButton) {
        guard let oldPassword = oldPassword.text, !oldPassword.isEmpty else {
            showAlert(title: "Error", message: "Old password is required")
            return
        }
        guard let newPassword = newPassword.text, !newPassword.isEmpty else {
            showAlert(title: "Error", message: "New password is required")
            return
        }
        guard let confirmPassword = confirmPassword.text, !confirmPassword.isEmpty else {
            showAlert(title: "Error", message: "Confirm password is required")
            return
        }
        if oldPassword != correctOldPassword {
            showAlert(title: "Error", message: "Old password is incorrect")
            return
        }
        if newPassword.count < 6 {
            showAlert(title: "Error", message: "New password must be at least 6 characters long")
            return
        }
        if newPassword != confirmPassword {
            showAlert(title: "Error", message: "New password and confirm password do not match")
            return
        }
        
        // Save new password
        UserDefaults.standard.set(newPassword, forKey: "UserPassword")
        
        // Show success message and navigate back to login screen
        showAlert(message: "Password reset successfully")
    }
    
    private func showAlert(title: String = "Alert", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            // Navigate back to the login screen after password reset
            self.navigationController?.popViewController(animated: true)
        }))
        present(alertController, animated: true, completion: nil)
    }
}
