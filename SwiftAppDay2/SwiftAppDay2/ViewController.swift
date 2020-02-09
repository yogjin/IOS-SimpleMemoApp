//
//  ViewController.swift
//  SwiftAppDay2
//
//  Created by cse on 2020. 2. 4..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        list = UserDataManager.shared.getList(with: UserDataManager.LIST_KEY_DEFAULT)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //timeInterval을 담는 list
    var list:[TimeInterval] = []
    
    @IBAction func AddNewMemo(_ sender: Any) {
        let newtime = makeNewDate()
        list.append(newtime)
        //2.데이터불러오는 부분
        if UserDataManager.shared.saveList(with: UserDataManager.LIST_KEY_DEFAULT, list: list){
            self.table.reloadSections(IndexSet(0...0), with: .automatic)
        }
        //table.reloadData()
    }
    //클릭하는 당시의 시간을 리턴.
    func makeNewDate()->TimeInterval {
        let date = Date()
        return date.timeIntervalSince1970
    }
    //time을 string으로 변환후 리턴.
    func timeString(time:TimeInterval)->String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        let timezone = TimeZone.current.abbreviation() ?? "CET"
        dateFormatter.timeZone = TimeZone(abbreviation: timezone)
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss.SSSS"
        
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

extension ViewController:
    UITableViewDelegate,
UITableViewDataSource{
    
    //Table표시
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    //각 셀에 들어갈 내용.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //indexPath란
        cell.textLabel?.text = timeString(time: list[indexPath.row])
        return cell
    }
    
    //스와이프 삭제
    func tableView(_ tableView: UITableView, editActionsForRowAt
        indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style:.destructive, title: "삭제") { (action, indexPath) in
            self.list.remove(at: indexPath.row)
            //reloadSections는 reloadData와 다르게 애니매이션효과가 있다.
            //IndexSet(0...0)은
            if UserDataManager.shared.saveList(with: UserDataManager.LIST_KEY_DEFAULT, list: self.list){
                self.table.reloadSections(IndexSet(0...0), with: .automatic)
            }
            //self.table.reloadSections(IndexSet(0...0), with:.automatic)
        }
        return [deleteAction]
    }
    
    //callback
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let timeStamp = list[indexPath.row]
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoVC") as? MemoVC {
            vc.timestamp = timeStamp
            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
}
