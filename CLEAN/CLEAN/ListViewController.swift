//
//  ListViewController.swift
//  CLEAN
//
//  Created by eunji on 2018. 5. 16..
//  Copyright © 2018년 clean. All rights reserved.
//

import UIKit

protocol SendDataDelegate {
    func sendData(isNew: Bool, offset: Int)
}

class ListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var delegate: SendDataDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    var depth = 0
    
    var images = [UIImage(named: "livingroom"), UIImage(named: "kitchen"), UIImage(named: "bathroom"), UIImage(named: "mainroom"), UIImage(named: "smallroom"), UIImage(named: "bedroom"), UIImage(named: "dressroom"),UIImage(named: "electronics"), UIImage(named: "etc")]
    
    var num: Int {
        return images.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idiot", for: indexPath) as! ListCollectionViewCell
        cell.placeImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.reloadData()
        
        if depth == 0 && indexPath.row == 2 {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "list") as? ListViewController     {
<<<<<<< HEAD
                vc.images=[UIImage(named: "basin"), UIImage(named: "floor"), UIImage(named: "toilet")]
                vc.depth = (self.depth+indexPath.row)*10
=======
                vc.images=[UIImage(named: "basin"), UIImage(named: "floor"), UIImage(named: "mirror"), UIImage(named: "toilet"), UIImage(named: "towerholder")]
                vc.depth = self.depth+1
>>>>>>> aad299be5e534bd116061b4b7a81adebf6ea93e1
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            if let vc = UIStoryboard.init(name: "DetailSet", bundle: nil).instantiateInitialViewController() as? DetailSetViewController {
            //self.present(vc, animated: true, completion: nil)
                vc.offset = indexPath.row + depth
                vc.isInsert = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/3, height: collectionView.bounds.height/3)
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
