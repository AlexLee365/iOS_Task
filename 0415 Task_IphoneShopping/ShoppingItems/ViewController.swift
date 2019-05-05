//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var data : [(String, String, Int, Int)] = []     // imageView, textLabel, CountLabel, 재고수량
    
    var imageData : [String] = ["iPhone8", "iPhoneSE_Gold", "iPhoneSE_RoseGold", "iPhoneX_SpaceGray", "iPhoneX_White"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 70
        
        dataAppend()
        
        tableView.register(ItemCell.self, forCellReuseIdentifier: "Custom")
    }
    
    func dataAppend() {         // 데이터 15개 추가
        for i in 1...15 {
            data.append((imageData.randomElement()!, "iphone \(i)" , 1, (4...10).randomElement()!))
        }
    }
    
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! ItemCell
        
        cell.delegate = self
        
        cell.imageView2.image = UIImage(named: data[indexPath.row].0)
        cell.titleLabel.text = data[indexPath.row].1
        cell.countLabel.text = String( data[indexPath.row].2 )
        
        return cell
    }
}

extension ViewController : ItemCellDelegate {
    func passSelf(itemCell: ItemCell) {
        var index = tableView.indexPath(for: itemCell)!
        let cell = tableView.cellForRow(at: index) as! ItemCell
        
        guard data[index.row].2 < data[index.row].3 else {
            let alertController = UIAlertController(title: "수량초과", message: "더 이상 구매할 수 없습니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            present(alertController, animated: true)
            
            UIView.animate(withDuration: 0.8) {
                cell.backgroundColor = .red
            }
            UIView.animate(withDuration: 0.8) {
                cell.backgroundColor = .white
            }
            
            return
        }
        
        
        data[index.row].2 += 1
        cell.countLabel.text = String( data[index.row].2 )
        
    }
    
    
}
