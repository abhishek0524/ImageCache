//
//  ViewController.swift
//  ImageLoad
//
//  Created by apple on 16/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    var link: Links? = nil
    let apiReq: ApiRequest = ApiRequest()
    var respVal:[ApiResponse] = []
    
    @IBOutlet weak var spinner:UIActivityIndicatorView!
    @IBOutlet weak var tblvw:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nibNameActive = String(describing: ImgCellTVC.self)
        tblvw?.register(UINib(nibName: nibNameActive, bundle: nil), forCellReuseIdentifier: nibNameActive)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        spinner.isHidden = false
        
        apiReq.getApiReq { (_apiResponse) in
            
            if(_apiResponse?.count != 0)
            {
                self.respVal = _apiResponse ?? []
//                self.link = _apiResponse?.links
//                self.arrLink.append(self.link?.download_location ?? "")

                DispatchQueue.main.async {
                    self.tblvw.reloadData()
                    self.spinner.isHidden = true
                }
            }

        }
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        respVal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImgCellTVC") as! ImgCellTVC

        let animalImageUrl = URL(string: (respVal[indexPath.row].links.download))!
        cell.imgVW.loadImage(fromURL: animalImageUrl, placeHolderImage: "default")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        151
    }
    
    
}

