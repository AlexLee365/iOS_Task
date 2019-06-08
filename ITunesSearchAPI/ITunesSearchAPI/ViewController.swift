//
//  ViewController.swift
//  ITunesSearchAPI
//
//  Created by Alex Lee on 07/06/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    let itunesTableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    var data = [Song]()
    var inputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(itunesTableView)
        itunesTableView.frame = view.frame
        itunesTableView.dataSource = self
        itunesTableView.rowHeight = 60
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        
        title = "ITunes Musics"
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "음악을 검색하세요"
        //        searchController.obscuresBackgroundDuringPresentation = false
        
        
        
    }
    
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if let reuseableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reuseableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        
        
        if data[indexPath.row].artworkUrl100Image == nil {
            guard let url = URL(string: data[indexPath.row].artworkUrl100) else { print("url변환 실패"); return cell}
            cell.imageView?.image = url.convertToUIImage()
        } else {
            cell.imageView?.image = data[indexPath.row].artworkUrl100Image
        }
        
        cell.textLabel?.text = data[indexPath.row].artistName
        cell.detailTextLabel?.text = data[indexPath.row].trackName
        cell.accessoryType = .detailButton
        
        
        return cell
    }
    
    
}



extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("검색중")
        inputText = searchController.searchBar.text ?? ""
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("--------------------------[SearchBarTextDidEndEditing]--------------------------")
        data.removeAll()
        
        inputText = searchBar.text ?? ""
        guard inputText != "" else { return }
        
        var itunesAPIString = "https://itunes.apple.com/search?media=music&entity=song&term=" + inputText
        
        let req = AF.request(itunesAPIString)
        
        print("req.validtae: ", req.validate())
        
        req.validate().responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print("--------------------------[Failure]--------------------------")
                print(error)
            case .success(let value):
                print("--------------------------[Success]--------------------------")
                
                
                guard let valueDict = value as? [String: Any],
                    let results = valueDict["results"] as? [[String: Any]]
                    else { return print("형변환 실패")}
                
                // =================================== 기존방식 ===================================
//                results.map{
//                    guard let artistName = $0["artistName"] as? String,
//                        let trackName = $0["trackName"] as? String,
//                        let artworkUrl100 = $0["artworkUrl100"] as? String else { print("artistName 변환실패"); return () }
//
////                    guard let url = URL(string: artworkUrl100) else { print("url주소 변환 실패"); return () }
//                    //                    let image = url.convertToUIImage()
//                    //                    let image = (url.convertToUIImage())?.resize(scale: 15)
//
//
//                    let song = Song(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100, artworkUrl100Image: nil)
//                    self.data.append(song)
//                    return song
//                    }
//                    .forEach{ print($0) }
//                self.itunesTableView.reloadData()
                
                //                DispatchQueue.global().async {
                //                    print("--------------------------[image값 입력시작]--------------------------")
                //                    for i in 0..<self.data.count {
                //                        guard let url = URL(string: self.data[i].artworkUrl100) else { print("url주소 변환 실패"); return () }
                ////                        self.data[i].artworkUrl100Image = (url.convertToUIImage())?.resize(scale: 0.2)
                ////                        self.data[i].artworkUrl100Image = url.convertToUIImageWithSession()
                ////                        self.data[i].artworkUrl100Image = url.convertToUIImage()
                //
                //                        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                //                            guard error == nil else { return print(error!.localizedDescription)}
                //                            guard let data = data else { return print("Error: data is not exist")}
                //
                //                            let image = UIImage(data: data)
                //                            self.data[i].artworkUrl100Image = image
                //                            print("image변환값: ", self.data[i].artworkUrl100Image, "/ image 사이즈: ", self.data[i].artworkUrl100Image?.size)
                //                        }
                //                        dataTask.resume()
                //
                //                    }
                ////                }
                
                // =================================== session으로 테스트 ===================================
                results.forEach{
                    guard let artistName = $0["artistName"] as? String,
                        let trackName = $0["trackName"] as? String,
                        let artworkUrl100 = $0["artworkUrl100"] as? String else { print("artistName 변환실패"); return () }
                    guard let url = URL(string: artworkUrl100) else { print("url주소 변환 실패"); return () }
                    
                    
                    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                        guard error == nil else { return print(error!.localizedDescription)}
                        guard let data = data else { return print("Error: data is not exist")}
                        
                        let image = UIImage(data: data) ?? UIImage()
                        
                        print("image변환값: ", image)
                        let song = Song(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100, artworkUrl100Image: image)
                        self.data.append(song)
                        
                        DispatchQueue.main.async {
                            self.itunesTableView.reloadData()
                        }
                    }
                    dataTask.resume()
                }
            }
        }
    }
    
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("--------------------------[ListButtonClicked]--------------------------")
    }
    
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("스코프가 눌렸음")
    }
}


extension UIImage {
    func resize(scale: CGFloat) -> UIImage?
    {
        let image = self
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        let size = image.size.applying(transform)
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(origin: .zero, size: size))
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultImage
    }
}

extension URL {
    func convertToUIImage() -> UIImage? {
        var url = self
        var image = UIImage()
        do {
            let data = try Data(contentsOf: url)
            image = UIImage(data: data) ?? UIImage()
        }catch let err {
            print("URL convertToUIImage Error : \(err.localizedDescription)")
        }
        return image
    }
    
    func convertToUIImageWithSession() -> UIImage? {
        var image = UIImage()
        
        let dataTask = URLSession.shared.dataTask(with: self) { (data, response, error) in
            guard error == nil else { return print(error!.localizedDescription)}
            guard let data = data else { return print("Error: data is not exist")}
            
            image = UIImage(data: data) ?? UIImage()
        }
        dataTask.resume()
        
        return image
    }
}

