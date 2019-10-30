//
//  AboutUsViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 29/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var JsonImageOne: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL=URL(string: "https://gocity.com/new-york/sites/g/files/ufrfmb171/files/styles/tile/public/New-York-skyline_0.jpg?itok=QGe7h8G3")!
        let task=URLSession.shared.dataTask(with:imageURL){(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.JsonImageOne.image=loadImage
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
