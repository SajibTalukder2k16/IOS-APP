//
//  AboutUsViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 29/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var SajibImageView: UIImageView!
    override func viewDidLoad() {
        
        SajibImageView.layer.cornerRadius = SajibImageView.frame.size.width/2
        SajibImageView.clipsToBounds = true
        SajibImageView.layer.borderColor = UIColor.black.cgColor
        SajibImageView.layer.borderWidth = 4
        super.viewDidLoad()
        let imageURL=URL(string: "https://tinyurl.com/talukdersajib")!
        let task=URLSession.shared.dataTask(with:imageURL){(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.SajibImageView.image=loadImage
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   // Do any additional setup after loading the view.
}
