//
//  ViewController.swift
//  assementAstuteSol
//
//  Created by Ali on 08/01/2022.
//

import UIKit
import SDWebImage

class GridViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    //MARK: Variables
    var Arr = [images]()
    var apimanager = ServiceManager()
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: ViewWillApear
    override func viewWillAppear(_ animated: Bool) {
        apimanager.loadData() { (results) in
            self.Arr = results
            //print(self.Arr)
            DispatchQueue.main.async {
                self.collectionView.dataSource = self
                self.collectionView.delegate = self
                self.collectionView.reloadData()
                
           }
    }
    }
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
       
        
}
    //MARK: CollectionViewFunctions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        nextViewController.titlevalue = Arr[indexPath.row].title_long
        nextViewController.ratingvalue = "Rating: \(Arr[indexPath.row].rating ?? "")"
        nextViewController.genere = "Genere: \(Arr[indexPath.row].genres ?? "")"
        nextViewController.summary = "Summary: \n\(Arr[indexPath.row].summary ?? "")"
        nextViewController.languagevalue = "Language: \(Arr[indexPath.row].language ?? "")"
        nextViewController.backgroundURL = Arr[indexPath.row].background_image
        nextViewController.ImageURL = Arr[indexPath.row].cover_image
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(Arr.count)
        return Arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        print(Arr[indexPath.row].title)
        cell.titlelbl.text = Arr[indexPath.row].title
        let URl = Arr[indexPath.row].cover_image ?? ""
        let ImageURl = "https://blogswizards.com/mobile_app_assignment/\(URl)"
     //   print(ImageURl)
        cell.imgView.sd_setImage(with: URL(string: ImageURl), placeholderImage: UIImage(named: "placeholder"))
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
   
    
}
