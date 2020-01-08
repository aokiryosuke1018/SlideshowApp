//
//  EnlargeViewController.swift
//  SlideshowApp
//
//  Created by 青木亮祐 on 2019/12/26.
//  Copyright © 2019 ryosuke.aoki. All rights reserved.
//

import UIKit

class EnlargeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 画像に初期値として値を設定
        enlargeView.image = enlargeViewImage
        // 画像を拡大する（transformプロパティに変形の関数を入れる)
        enlargeView.transform = CGAffineTransform(scaleX: 2.0, y:2.0)
        
    }
        
    // 拡大された画像を載せる土台となるUIImageView
    @IBOutlet weak var enlargeView: UIImageView!
    
    // 拡大される予定の画像それ自体のための箱を設置(とりあえず初期値をpartenonにしておく)
    var enlargeViewImage = UIImage(named: "partenon.jpg")!
     
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
