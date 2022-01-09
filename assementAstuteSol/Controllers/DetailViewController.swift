//
//  DetailViewController.swift
//  assementAstuteSol
//
//  Created by Ali on 09/01/2022.
//

import UIKit
import SDWebImage
class DetailViewController: UIViewController {
   
    //MARK: IBOutLets
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var generelbl: UILabel!
    @IBOutlet weak var Languagelbl: UILabel!
    @IBOutlet weak var Summarylbl: UILabel!
    @IBOutlet weak var ratinglbl: UILabel!
    @IBOutlet weak var backgroundimg: UIImageView!
    
    //MARK: Variables
    var backgroundURL: String?
    var ImageURL: String?
    var titlevalue: String?
    var genere: String?
    var summary: String?
    var languagevalue: String?
    var ratingvalue: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ImagURl = "https://blogswizards.com/mobile_app_assignment/\(ImageURL ?? "")"
        let BackgroundURl = "https://blogswizards.com/mobile_app_assignment/\(backgroundURL ?? "")"
        ImageView.sd_setImage(with: URL(string: ImagURl), placeholderImage: UIImage(named: "placeholder"))
        backgroundimg.sd_setImage(with: URL(string: BackgroundURl), placeholderImage: UIImage(named: "placeholder"))
        titlelbl.text = titlevalue
        generelbl.text = genere
        Languagelbl.text = languagevalue
        Summarylbl.text = summary
        ratinglbl.text = ratingvalue
    
    }
}
