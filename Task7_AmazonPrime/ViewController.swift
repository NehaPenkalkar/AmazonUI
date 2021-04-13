import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var segCtrl: UISegmentedControl!
    
    let headArr = ["Hollywood Series","Bollywood Series","Hollywood Movies","Bollywood Movies","Anime Series","Anime Movies"]
    let showArr = [["13 Reasons Why","Breaking Bad","Brooklyn Nine-Nine","Chernobyl","Elite"],
                   ["Asur","Patal Lok","College Romance"],
                   ["13 Reasons Why","Breaking Bad","Brooklyn Nine-Nine","Chernobyl","Elite"],
                   ["13 Reasons Why","Breaking Bad","Brooklyn Nine-Nine","Chernobyl","Elite"],
                   ["13 Reasons Why","Chernobyl","Brooklyn Nine-Nine","Chernobyl","Elite"],
                   ["13 Reasons Why","Breaking Bad","Brooklyn Nine-Nine","Chernobyl","Elite"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SegCtrlPress(_ sender: Any) {
        tblView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return headArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVC") as! CustomTVC
        cell.CustomCV.reloadData()
        cell.CustomCV.tag = indexPath.section
        cell.CustomCV.dataSource = self
        cell.CustomCV.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "CustomHeader") as! CustomHeader
        header.headerLbl.text = headArr[section]
        return header
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showArr[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVC", for: indexPath) as! CustomCVC
        
//        if segCtrl.selectedSegmentIndex == 0{
//            cell.showImg.image = UIImage(named: "\(showArr[collectionView.tag][indexPath.row])")
//            return cell
//        }
        
      cell.showImg.image = UIImage(named: "\(showArr[collectionView.tag][indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/2.2, height: collectionView.frame.size.height)
    }
}


