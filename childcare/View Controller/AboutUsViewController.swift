//
//  AboutUsViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 29/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    var userdocid = String()
    
    struct Response: Codable { // or Decodable
        let name: String
        let roll: String
    }

    @IBOutlet weak var SajibNameLabel: UILabel!
    
    @IBOutlet weak var SajibRollLabel: UILabel!
    
    //@IBOutlet weak var sajibrollTextField: UITextField!
   // @IBOutlet weak var sajibnameTextField: UITextField!
    
    
    @IBOutlet weak var RiadNameLabel: UILabel!
    
    @IBOutlet weak var RiadRollLabel: UILabel!
    
    
    @IBOutlet weak var TithyRollLable: UILabel!
    @IBOutlet weak var TithyNameLabel: UILabel!
    
    
    @IBOutlet weak var RabayaNameLabel: UILabel!
    @IBOutlet weak var RabayaRollLabel: UILabel!
    
    
    @IBOutlet weak var AshikNameLabel: UILabel!
    @IBOutlet weak var AshikRollLabel: UILabel!
    
    @IBOutlet weak var SajibImageView: UIImageView!
    
    @IBOutlet weak var RabayaImageView: UIImageView!
    
    @IBOutlet weak var TithyImageView: UIImageView!
    
    @IBOutlet weak var RiadImageView: UIImageView!
    
    @IBOutlet weak var AbirImageView: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "abouttohome")
        {
            let homecontroller = segue.destination as! HomeViewController// ProfileViewController
            homecontroller.userdocid = userdocid
        }
    }
    
    let sajibjsonurl = "https://api.myjson.com/bins/oed8u"
    let tithyjsonurl = "https://api.myjson.com/bins/lf77y"
    let riadjsonurl = "https://api.myjson.com/bins/h3f72"
    let rabayajsonurl = "https://api.myjson.com/bins/107fpq"
    let ashikjsonurl = "https://api.myjson.com/bins/dkyq6"
    
    
    override func viewDidLoad() {
        
        /*SajibImageView.layer.cornerRadius = SajibImageView.frame.size.width/2
        SajibImageView.clipsToBounds = true
        SajibImageView.layer.borderColor = UIColor.black.cgColor
        SajibImageView.layer.borderWidth = 4*/
        super.viewDidLoad()
        let imageURL=URL(string: "https://tinyurl.com/talukdersajib")!
        let task=URLSession.shared.dataTask(with:imageURL){(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.SajibImageView.image=loadImage
            }
        }
        task.resume()
        let imageURL1=URL(string: "https://tinyurl.com/rabayarabaya")!
        let task1=URLSession.shared.dataTask(with:imageURL1){(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.RabayaImageView.image=loadImage
            }
        }
        task1.resume()
        let imageURL2=URL(string: "https://tinyurl.com/tanutithy")!
        let task2=URLSession.shared.dataTask(with:imageURL2){(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.TithyImageView.image=loadImage
            }
        }
        task2.resume()
        let imageURL3=URL(string: "https://tinyurl.com/riyadriad")!
        let task3=URLSession.shared.dataTask(with:imageURL3){(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.RiadImageView.image=loadImage
            }
        }
        task3.resume()
        let imageURL4=URL(string: "https://tinyurl.com/ashikabir")!
        let task4=URLSession.shared.dataTask(with:imageURL4){(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.AbirImageView.image=loadImage
            }
        }
        task4.resume()
        setUpElements()
        self.downloadJsonWithUrl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setUpElements()
    {
        Utilities.imageStyle(SajibImageView)
        Utilities.imageStyle(RabayaImageView)
        Utilities.imageStyle(TithyImageView)
        Utilities.imageStyle(RiadImageView)
        Utilities.imageStyle(AbirImageView)
    }
    func downloadJsonWithUrl()
    {
        if let url = URL(string: sajibjsonurl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)

                        self.SajibNameLabel.text = res.name;
                        self.SajibRollLabel.text = "Roll: " + res.roll
                        //print(res.roll)
                    } catch let error {
                        print(error)
                    }
                }
                }.resume()
        }
        if let url = URL(string: tithyjsonurl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        
                        self.TithyNameLabel.text = res.name;
                        self.TithyRollLable.text = "Roll: " + res.roll
                        //print(res.roll)
                    } catch let error {
                        print(error)
                    }
                }
                }.resume()
        }
        if let url = URL(string: riadjsonurl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        
                        self.RiadNameLabel.text = res.name;
                        self.RiadRollLabel.text = "Roll: " + res.roll
                        //print(res.roll)
                    } catch let error {
                        print(error)
                    }
                }
                }.resume()
        }
        if let url = URL(string: rabayajsonurl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        
                        self.RabayaNameLabel.text = res.name;
                        self.RabayaRollLabel.text = "Roll: " + res.roll
                        //print(res.roll)
                    } catch let error {
                        print(error)
                    }
                }
                }.resume()
        }
        if let url = URL(string: ashikjsonurl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        
                        self.AshikNameLabel.text = res.name;
                        self.AshikRollLabel.text = "Roll: " + res.roll
                        //print(res.roll)
                    } catch let error {
                        print(error)
                    }
                }
                }.resume()
        }
    }

   // Do any additional setup after loading the view.
}
