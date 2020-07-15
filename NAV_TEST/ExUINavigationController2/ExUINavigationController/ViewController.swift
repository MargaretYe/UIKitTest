
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    
    let fullScreenSize =  UIScreen.main.bounds.size
        
    var info = [
        ["服务条款","隐私协议","用户体验计划"]
        ]
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 如果導覽列底色在切換頁面後會改變
        // 可將設置底色放在這個方法裡
        self.navigationController!.navigationBar.barTintColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 底色
        self.view.backgroundColor = UIColor.white
        // 導覽列標題
        self.title = "关于我们"
        // 導覽列底色
        self.navigationController!.navigationBar.barTintColor = UIColor.lightGray
        // 導覽列是否半透明
        self.navigationController!.navigationBar.isTranslucent = false
        // 導覽列左邊按鈕
        let leftButton = UIBarButtonItem(image: UIImage(named:"check"), style:.plain , target:self , action: #selector(ViewController.check))
        // 加到導覽列中
        self.navigationItem.leftBarButtonItem = leftButton
        
        //加入灰色图标
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        // 將 firstView 加入到 self.view
        self.view.addSubview(firstView)
        // 設置 UIView 的位置到畫面的中心
        firstView.center = CGPoint(x: fullScreenSize.width * 0.5 , y: fullScreenSize.height * 0.2)
        // 將 UIView 的底色設置為藍色
        firstView.backgroundColor = UIColor.lightGray
        firstView.layer.cornerRadius = 20

        //建立Label1
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        // 文字內容
        myLabel.text = "Master Clearner"
        // 文字顏色
        myLabel.textColor = UIColor.black
        // 文字的字型與大小
        myLabel.font = UIFont(name: "PingFangSC-Medium", size: 22)
       // 也可以簡寫成這樣
        myLabel.textAlignment = .center
        // 文字行數
        myLabel.numberOfLines = 1
        // 設置於畫面的中心點
        myLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.2 + 70)
        // 加入到畫面中
        self.view.addSubview(myLabel)
        //建立Label2
        let myLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        myLabel2.text = "V1.0.0"
        myLabel2.textColor = UIColor.black
        myLabel2.font = UIFont(name: "PingFangSC-Regular", size: 20)
        myLabel2.textAlignment = .center
        myLabel2.numberOfLines = 1
        myLabel2.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.2 + 92)
        self.view.addSubview(myLabel2)
            
        //建立TableView
        let myTableView = UITableView(frame: CGRect(x: 8.5 ,y: 360.25,width: fullScreenSize.width,height:
            fullScreenSize.height - 360.25),style: .grouped)
            
        myTableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
            
        myTableView.delegate = self
        myTableView.dataSource = self
            
        myTableView.separatorStyle = .singleLine
        
        myTableView.backgroundColor = UIColor.white
        
        myTableView.separatorInset = UIEdgeInsets.init(top: 0,left: 8.5,bottom: 0,right: 8.5)
            
        myTableView.allowsSelection = true
            
        myTableView.allowsMultipleSelection = false
            
        self.view.addSubview(myTableView)
            
    }
    
   func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
          
          return info[section].count
      }
    
    func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as UITableViewCell
      
          if indexPath.section == 0 {
              if indexPath.row == 0 {
                  cell.accessoryType = .disclosureIndicator
              } else if indexPath.row == 1 {
                  cell.accessoryType = .disclosureIndicator
              }else if indexPath.row == 2 {
                  let accessoryView = UISwitch()
                  accessoryView.isOn = false
                  accessoryView.addTarget(self, action: #selector(ViewController.switchValueChanged(sender:)), for: .valueChanged)
                  cell.accessoryView = accessoryView
              }
        }
              
          if let myLabel = cell.textLabel {
                  myLabel.text = "\(info[indexPath.section][indexPath.row])"

              }
                
              return cell
                  
    }
    
    func tableView(_ tableView: UITableView,didSeleceRowAt indexPath: IndexPath) {
          
          tableView.deselectRow(at: indexPath, animated: true)
          
          let name = info[indexPath.section][indexPath.row]
          
          print("按下的是\(name)的detail")
          
      }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    @objc private func switchValueChanged(sender:UISwitch) {
           let tempSwitch = sender
           if tempSwitch.isOn {

           let myLabel3 = UILabel(frame: CGRect(x: 9, y: 800, width: fullScreenSize.width - 30, height: fullScreenSize.height - 400))
           myLabel3.text = "收集的数据将仅用于分析、评估、检验及提升产品的用户体验。我们回尊重您的隐私，不会将这些信息提供给任何第三方，也不会未经您允许将这些信息用于其他商业用途。"
           myLabel3.textColor = UIColor.black
           myLabel3.font = UIFont(name: "PingFangSC-Regular", size: 10)
           myLabel3.textAlignment = .left
           myLabel3.numberOfLines = 3
           myLabel3.textColor = UIColor.lightGray
           myLabel3.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.9 - 40)
           self.view.addSubview(myLabel3)
           } else {
            
            let myLabel4 = UILabel(frame: CGRect(x: 9, y: 800, width: fullScreenSize.width - 30, height: fullScreenSize.height - 400))
            myLabel4.text = nil
        }
       }
    
    
    @objc func check() {
        print("check button action")
        
    }
    

}
