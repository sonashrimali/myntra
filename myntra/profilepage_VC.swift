import UIKit

class profilepage_VC: UIViewController {
    
    @IBOutlet weak var tbl_view: UITableView!
    
    var imgArr  = [UIImage(systemName: "person.fill"),UIImage(systemName: "person.fill"),UIImage(systemName: "person.fill"),UIImage(systemName: "person.fill"),UIImage(systemName: "person.fill")]
    var titleArr = [" profilepage", "Saved Address", "Wishlist", "My order", "Setting"]
    
   
    @IBOutlet weak var acc: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register your custom UITableViewCell class or nib file
        self.tbl_view.register(UINib(nibName: "acc", bundle: nil), forCellReuseIdentifier: "acc")
        
        // Set table view delegate and data source
        self.tbl_view.delegate = self
        self.tbl_view.dataSource = self
    }
    
    
    @IBAction func login(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home_VC") as! Home_VC
        vc.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension profilepage_VC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell with the identifier "TableViewController"
        let cell = tableView.dequeueReusableCell(withIdentifier: "acc", for: indexPath) as! acc
        
        // Configure the cell with data from your arrays
        cell.img_icon.image = self.imgArr[indexPath.row]
        cell.lbl_nm.text = self.titleArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = self.storyboard?.instantiateViewController(identifier: "Home_VC") as! Home_VC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 1 {
            let vc = self.storyboard?.instantiateViewController(identifier: "Order_VC") as! Order_VC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2 {
            
            
        }
        else if indexPath.row == 3 {
        }
        else if indexPath.row == 4{
            
        }
        
    }
}

    

