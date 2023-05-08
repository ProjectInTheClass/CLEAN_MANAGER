//
//  MainViewController.swift
//  CLEAN
//
//  Created by eunji on 2018. 5. 16..
//  Copyright © 2018년 김장현. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // 뷰가 로드될때 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* 뷰가 나타나기직전에 실행되는 함수
    ListView와 같은 navigation bar를 공유하고있어서
    아래 함수를 만들어주지않으면 ListView의 설정이 그대로 적용됨. */
    override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = true
        
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
