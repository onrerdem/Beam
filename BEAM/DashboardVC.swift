//
//  DashboardVC.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import UIKit

class DashboardVC: UIViewController {
    @IBOutlet weak var dashboardTv: UITableView!
    var menuList : [Menu] = []
    
    var tokenData : String = ""
    var service = WebAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashboardTv.delegate = self
        dashboardTv.dataSource = self
        
    }
    
    func getMenu(token : String) -> Void {
        service.menuPost(tokenData: token) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for modul in results.result {
                        self?.menuList.append(modul)
                    }
                case .failure(_): break
                    
                }
            }
        }
    }
    
}

extension DashboardVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.filter{$0.isShowDashboard == true && ($0.type == 1 || $0.type == 7 )}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.imgURL = menuList.filter{$0.isShowDashboard == true && ($0.type == 1 || $0.type == 7 )}[indexPath.row].icon!
        cell.ModuleName.text = menuList.filter{$0.isShowDashboard == true && ($0.type == 1 || $0.type == 7 )}[indexPath.row].header
        return cell
        
        
        
    }
    
    
}
