//
//  ViewController.swift
//  TableHeader
//
//  Created by Danyl Timofeyev on 21.01.2021.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellData = indexPath.row.description
        cell.textLabel?.text = cellData
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y * -1
        let height = min(max(y, 60), 500)
        headerImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}


class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let headerImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 0.1))
        
        headerImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        headerImageView.image = UIImage.init(named: "header")
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        view.addSubview(headerImageView)
        
        tableView.reloadData()
    }


}

