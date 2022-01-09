//
//  ViewController.swift
//  assementAstuteSol
//
//  Created by Ali on 08/01/2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var Arr = [images]()
    var apimanager = ServiceManager()
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
      
        apimanager.loadData() { (results) in
            self.Arr = results
      //      print(self.Arr)
            DispatchQueue.main.async {
                self.tableView.reloadData()
              
           }
    }

}
    
    //MARK: TableViewFunctions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arr.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        nextViewController.titlevalue = Arr[indexPath.row].title
        nextViewController.ratingvalue = "Rating: \(Arr[indexPath.row].rating ?? "")"
        nextViewController.genere = "Genere: \(Arr[indexPath.row].genres ?? "")"
        nextViewController.summary = "Summary: \n\(Arr[indexPath.row].summary ?? "")"
        nextViewController.languagevalue = "Language: \(Arr[indexPath.row].language ?? "")"
        nextViewController.backgroundURL = Arr[indexPath.row].background_image
        nextViewController.ImageURL = Arr[indexPath.row].cover_image
        self.navigationController?.pushViewController(nextViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titlelbl.text = Arr[indexPath.row].title
        cell.generelbl.text = "Genere: \(Arr[indexPath.row].genres ?? "")"
        cell.ratinglbl.text = "Rating: \(Arr[indexPath.row].rating ?? "")"
        cell.summarylbl.text =  Arr[indexPath.row].summary
        let URl = Arr[indexPath.row].cover_image ?? ""
        let ImageURl = "https://blogswizards.com/mobile_app_assignment/\(URl)"
     //   print(ImageURl)
        cell.imgview.sd_setImage(with: URL(string: ImageURl), placeholderImage: UIImage(named: "placeholder"))
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }
   
    
}
