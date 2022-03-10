//
//  FeedVC.swift
//  Practicle
//
//  Created by Devang Lakhani  on 3/10/22.
//  Copyright © 2022 Devang Lakhani. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    //MARK: - Variables & Outlets
    @IBOutlet weak var collView : UICollectionView!
    @IBOutlet weak var tblView : UITableView!
    var arrFeed : [Feeds] = []
    
    //MARK: - ViewController LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed()
        prepareUI()
    }
}

//MARK: - Other Methods
extension FeedVC{
    func prepareUI(){
        collView.contentInset = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 0)
        tblView.allowsSelection = false
        tblView.separatorStyle = .none
        tblView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: _tabBarHeight + 10, right: 0)
    }
}

//MARK: - CollectionView Delegate & DataSource Methods
extension FeedVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : FeedCollCell
        if indexPath.section == 0{
            cell = collView.dequeueReusableCell(withReuseIdentifier: "addPictureCell", for: indexPath) as! FeedCollCell
            return cell
        }else{
            cell = collView.dequeueReusableCell(withReuseIdentifier: "usersCell", for: indexPath) as! FeedCollCell
            cell.imgUser.layer.cornerRadius = 5
            return cell
        }
    }
}

//MARK: - CollectionView DelegateFlowLayout Methods
extension FeedVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 100.widthRatio
        let width = height * 0.8
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


//MARK: - TableView Delegate & DataSource Methods
extension FeedVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FeedTblCell
        cell = tblView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTblCell
        if !arrFeed.isEmpty{
            let objFeed = arrFeed[indexPath.row]
            cell.configFeedCell(data: objFeed)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


//MARK: - API Web Call Methods
extension FeedVC{
    func loadFeed(){
        showMessage(title: "Wait Data Loading...", msg: "")
        let config = URLSessionConfiguration.default
        let url = URL(string: "http://www.raincoastvictoriascreenprinting.com/DoggyDate/api/getFeed/1")
        var requestUrl = URLRequest(url: url!)
        requestUrl.httpMethod = "GET"
        requestUrl.addValue("783m9jdynhiawgkqanlo0t4rk5ee6oczpvxbusft", forHTTPHeaderField: "Accesstoken")
        requestUrl.addValue("9sfm7nwvkio5prutad824pbqlxhae03ijgyz6xc1", forHTTPHeaderField: "Apikey")
        requestUrl.addValue("53", forHTTPHeaderField: "Userid")
        requestUrl.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: config)
        session.dataTask(with: requestUrl) {[weak self] (data, response, error) in
            guard let weakSelf = self, let data = data,error == nil else {return}
            do{
                if let dict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary{
                    if let feedData = dict["data"] as? NSDictionary{
                        if let arrFeedDict = feedData["feedList"] as? [NSDictionary]{
                            for dictData in arrFeedDict{
                                let objData = Feeds(dict: dictData)
                                weakSelf.arrFeed.append(objData)
                            }
                        }
                        DispatchQueue.main.async {
                            weakSelf.tblView.reloadData()
                        }
                    }
                }
                
            }catch{
                weakSelf.showMessage(title: error.localizedDescription, msg: "")
            }
        }.resume()
    }
}


//MARK: - Alert Methods
extension FeedVC{
    func showMessage(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
