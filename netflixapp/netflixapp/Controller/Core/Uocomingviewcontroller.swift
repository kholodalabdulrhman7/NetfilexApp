//
//  Uocomingviewcontroller.swift
//  netflixapp
//
//  Created by Kholod Sultan on 26/04/1444 AH.
//

import Foundation
import UIKit

class UpcomingViewController: UIViewController{
    private var titles:[Title] = [Title]()
    
    private let upcomingtable:UITableView = {
        let table = UITableView ()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "UPComing"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        
        
        
        view.addSubview(upcomingtable)
        upcomingtable.delegate = self
        upcomingtable.dataSource = self
        fetchUpcoming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingtable.frame = view.bounds
    }
    
    
    private func fetchUpcoming(){
        APICaller.shared.getUpcomingMovies{ [weak self] result in
            switch result {
            case.success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingtable.reloadData()
                }
            case.failure(let errer):
                print(errer.localizedDescription)
        }
        }
    }
    
    
}
extension UpcomingViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel.text = titles[indexPath.row].original_name? titles [indexPath.row].original_title "Unknow"
        return cell
    }
    
    
}
