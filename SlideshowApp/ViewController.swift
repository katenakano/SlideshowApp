//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hiroko Nakano on 2018/11/16.
//  Copyright © 2018 katenakano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextSlide: UIButton!
    @IBOutlet weak var returnSlide: UIButton!
    
    
    
    
    var timer: Timer!
    var timer_sec: Float = 0
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "SF.jpg",
            "SF_2.jpg",
            "SF_3.jpg",
            ]
       
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // バンドルした画像ファイルを読み込み
          let image = UIImage(named: "SF.jpg")
          imageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
     
    @IBAction func nextSlide(_ sender: Any) {
    
    print("nextSlide\(nextSlide)")
        //if self.timer != nil {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
            //self.timer = nil
            
       // }
        print("nextSlide\(nextSlide)")
    }
    
    
    @IBAction func returnSlide(_ sender: Any) {

       //if self.timer != nil {
        
        // 表示している画像の番号を1増やす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
            
        //self.timer = nil
        
        
       //}
    }
    
    @IBAction func stopSlide(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            nextSlide.isEnabled = false
            returnSlide.isEnabled = false
            
        }else{
            if self.timer != nil {
                self.timer.invalidate()   // 現在のタイマーを破棄する
                self.timer = nil
                
                nextSlide.isEnabled = true
                returnSlide.isEnabled = true
            }
        }
        
     
   
}
    
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
           resultViewController.image = self.imageView.image
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}
