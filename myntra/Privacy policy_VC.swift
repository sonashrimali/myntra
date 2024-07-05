//
//  Privacy policy_VC.swift
//  myntra
//
//  Created by APPLE SERVER on 26/06/24.
//

import UIKit

class Privacy_policy_VC: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    
    @IBOutlet weak var Privacy: UILabel!
    
    
    @IBOutlet weak var policy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Goback(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
    }
    
    func updateSearchResult(for searchController: UISearchController){
}
}
