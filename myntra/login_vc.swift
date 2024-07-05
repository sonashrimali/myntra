import UIKit

class login_vc: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var TF_havetrouble: UITextField!
    @IBOutlet weak var TF_forgetyourpassword: UITextField!
    @IBOutlet weak var TF_enterpassword: UITextField!
    @IBOutlet weak var TF_username: UITextField!
    @IBOutlet weak var TF_loginyouraccount: UILabel!
    @IBOutlet weak var Continue: UITextField!
    @IBAction func Google(_ sender: UIButton) {
    }
    @IBAction func Facebook(_ sender: UIButton) {
    }
    @IBAction func Instagram(_ sender: UIButton) {
    }
    @IBAction func act_resethere(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Reset_VC") as! Reset_VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func act_gethelp(_ sender: UIButton) {
        // Add functionality here if needed
    }
    @IBAction func act_login(_ sender: UIButton) {
        guard let username = TF_username.text, username.isEmpty == false else {
            showAlert(title: "Error", message: "Username is required")
            return
        }
        guard let password = TF_enterpassword.text, password.isEmpty == false else {
            showAlert(title: "Error", message: "Password is required")
            return
        }
        
        // Retrieve the saved password
        let savedPassword = UserDefaults.standard.string(forKey: "userPassword") ?? ""
        
        // Validate the entered password
        if password == savedPassword {
            // Login successful
            
        }
        print("Login successful for username: \(username)")
        print("Password: \(password)")
        
        if let profilepage_VC = self.storyboard?.instantiateViewController(withIdentifier: "profilepage_VC") {
            self.navigationController?.pushViewController(profilepage_VC, animated: true)
        }
        
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

