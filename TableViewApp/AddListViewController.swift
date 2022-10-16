//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by 古館和美 on 2022/10/16.
//

import UIKit

class AddListViewController: UIViewController {
    
    @IBOutlet weak var addText: UITextField!
    var taskArray: [String] = [] //入力したリストを格納する配列
    
    override func viewDidLoad() {// 読み込み処理
        super.viewDidLoad()
        //まずはUserDefaultsからすでに入力されているタスクをtaskArrayに読み込む
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
        
    }
    
    @IBAction func addTask(_ sender: Any) {
        let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
        taskArray.append(addText.text!) //Textで記入されたテキストを入れる
        userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存　上書き保存
        self.navigationController?.popViewController(animated: true) //1つ前の画面に自動的に戻る
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
