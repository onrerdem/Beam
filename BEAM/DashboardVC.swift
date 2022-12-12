//
//  DashboardVC.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import UIKit

class DashboardVC: UIViewController {
    @IBOutlet weak var dashboardTv: UITableView!
    var menuList : [Menu]?
    var tokenData : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashboardTv.delegate = self
        dashboardTv.dataSource = self

    }
    
}

extension DashboardVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dashboardTv.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Bakım"
        return cell
    }
    
    
}
