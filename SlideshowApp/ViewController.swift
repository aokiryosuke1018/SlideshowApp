//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 青木亮祐 on 2019/12/26.
//  Copyright © 2019 ryosuke.aoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var imageArray = [UIImage(named:"partenon.jpg"),UIImage(named: "erecthelion.jpg"),UIImage(named:"acropolice.jpg")]
    var timer: Timer! // timer.invalidage()がインスタンスメソッドなので準備
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 最初はpartenonが表示される
        imageView.image = imageArray[0]
        
    }
    
    // 進むを押して画像を変える
    @IBAction func forward(_ sender: Any) {
        if timer == nil{
        if imageView.image == imageArray[0]{
            imageView.image =  imageArray[1]
        }else if imageView.image == imageArray[1]{
            imageView.image = imageArray[2]
        }else{
            imageView.image = imageArray[0]
        }
        }
    }
    
    // 戻るを押して１つ前の画像に戻る
    @IBAction func back(_ sender: Any) {
        if timer == nil{
        if imageView.image == imageArray[0]{
            imageView.image =  imageArray[2]
        }else if imageView.image == imageArray[1]{
            imageView.image = imageArray[0]
        }else{
            imageView.image = imageArray[1]
        }
        }
    }

    // 再生ボタンをタップしてスライド開始
    // 2秒経つごとに、imageの中身がこれならばこれに変更、という内容
    // もう一度押した時は停止になるように、nilの場合のみ開始するようにする
    @IBAction func startAndStop(_ sender: Any) {
        if timer == nil{
         timer = Timer.scheduledTimer(
            timeInterval: 2.0, //繰り返す間隔(秒)
            target: self,
            selector: #selector(self.repeatImage),//repeatImage関数に委ねる
            userInfo: nil,
            repeats: true)
            buttonLabel.setTitle("停止",for: .normal)
        }else{
            timer.invalidate()
            timer = nil
            buttonLabel.setTitle("再生",for: .normal)
        }
    }
    
    
    @objc func repeatImage(){
        if imageView.image == imageArray[0]{
            imageView.image =  imageArray[1]
        }else if imageView.image == imageArray[1]{
            imageView.image = imageArray[2]
        }else{
            imageView.image = imageArray[0]
        }
    }
    
    
    // 一応接続はしたもののprepareメソッドで対応できるため意味はない
    @IBAction func imageClick(_ sender: Any) {
    }
    
    // prepareメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のEnlargeViewControllerを取得する
        let enlargeViewController:EnlargeViewController = segue.destination as! EnlargeViewController
        // 遷移先の画像を指定
            enlargeViewController.enlargeViewImage = imageView.image!
        
    }
    
    
    @IBAction func unwind(_ segue : UIStoryboardSegue){
        
    }
    

}

