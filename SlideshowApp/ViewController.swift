//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 浅尾栄志 on 2018/08/16.
//  Copyright © 2018年 jirokirameki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let sampleImg = [UIImage(named:"sampleImg1")!, UIImage(named:"sampleImg2")!, UIImage(named:"sampleImg3")!, UIImage(named:"sampleImg4")!]
    var currentImgNum = 0
    
    @IBOutlet weak var imgArea: UIImageView!
    
    var timer: Timer!
    @IBOutlet weak var autoPlayButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var goforwardButton: UIButton!
    
    
    @IBAction func showImg(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "showImg", sender: nil)
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のshowImgControllerを取得する
        let showImgController:ShowImgController = segue.destination as! ShowImgController
        // 遷移先のShowImgControllerで宣言しているimgに値を代入して渡す
//        showImgController.showImgArea.image = self.imgArea.image
        showImgController.img = self.imgArea.image

        // 遷移前に自動再生をオフ
        if self.autoPlayButton.currentTitle == "停止" {
            self.autoPlayButton.setTitle("自動再生", for: .normal)
            returnButton.isEnabled = true
            goforwardButton.isEnabled = true
            
            self.timer.invalidate()   // 現在のタイマーを破棄する
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 初期イメージをセット
        self.imgArea.image = sampleImg[currentImgNum]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 戻る
    @IBAction func returnButton(_ sender: Any) {
        currentImgNum = currentImgNum - 1
        if currentImgNum < 0 {
            currentImgNum = sampleImg.count - 1
        }
        self.imgArea.image = sampleImg[currentImgNum]
    }
    
    // 進む
    @IBAction func goforwardButton(_ sender: Any) {
        goforward()
    }
    
    // 自動再生
    @IBAction func autoPlay(_ sender: Any) {
        if self.autoPlayButton.currentTitle == "自動再生" {
            self.autoPlayButton.setTitle("停止", for: .normal)
            returnButton.isEnabled = false
            goforwardButton.isEnabled = false
            
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoPlayTimer(_:)), userInfo: nil, repeats: true)
            
        } else {
            self.autoPlayButton.setTitle("自動再生", for: .normal)
            returnButton.isEnabled = true
            goforwardButton.isEnabled = true
            
            self.timer.invalidate()   // 現在のタイマーを破棄する
        }
    }
    
    // autoPlay
    @objc func autoPlayTimer(_ timer: Timer) {
        goforward()
    }
    
    func goforward() {
        currentImgNum = currentImgNum + 1
        if currentImgNum >= sampleImg.count {
            currentImgNum = 0
        }
        self.imgArea.image = sampleImg[currentImgNum]
    }
}
