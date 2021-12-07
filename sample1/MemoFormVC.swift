//
//  MemoFormVC.swift
//  sample1
//
//  Created by 장웅 on 2021/12/07.
//

import UIKit
 

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate
, UINavigationControllerDelegate, UITextViewDelegate{
    var subject : String!
    
    
    @IBOutlet weak var preview: UIImageView!
    @IBOutlet weak var contents: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        //1.내용 입력 체크
        guard self.contents.text?.isEmpty == false else{
            let alert = UIAlertController(title: nil, message: "내용을 입력해 주세요", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true)
            return
        }
        
        let data  =   MemoData()
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        // 3. 앱 델리게이트 객체를 읽어온 다음, memolist 배열에 MemoData 객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append( data)
        
        // 작성폼 화면 종료하고 이전폼으로 되돌아 간다.
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController();
        picker.delegate = self
        picker.allowsEditing = true
        
        //화면 표시
        self.present(picker, animated: false )
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
      
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
       //선택된 이미지 미리보기 실행
          self.preview.image = info[.editedImage] as? UIImage
          picker.dismiss(animated: false)
      }

      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          picker.dismiss(animated: false)
      }
    func textViewDidChange(_ textView: UITextView) {
        //내용의 최대 15자리까지 읽어 subject 변수에 저장한다.
        let contents = textView.text as NSString
        let length = (( contents.length > 15) ? 15 : contents.length )
        self.subject = contents.substring(with:NSRange(location: 0, length: length))
        //네비게이션 타이틀에 표시한다.
        self.navigationItem.title = self.subject
    }

}
