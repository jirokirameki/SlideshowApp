//
//  ShowImgController.swift
//  SlideshowApp
//
//  Created by 浅尾栄志 on 2018/08/16.
//  Copyright © 2018年 jirokirameki. All rights reserved.
//

import UIKit

class ShowImgController: UIViewController {
    
    @IBOutlet weak var showImgArea: UIImageView!
    var img: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showImgArea.image = img
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
