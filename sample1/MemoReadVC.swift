//
//  MemoReadVC.swift
//  sample1
//
//  Created by 장웅 on 2021/12/07.
//

import UIKit

class MemoReadVC: UIViewController {

    var param: MemoData?
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var subject: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subject.text = param?.title
        
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        self.navigationItem.title = dateString
        // Do any additional setup after loading the view.
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
