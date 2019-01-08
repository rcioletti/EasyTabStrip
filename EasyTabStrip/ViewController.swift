//
//  ViewController.swift
//  EasyTabStrip
//
//  Created by Rodrigo Cioletti on 07/01/19.
//  Copyright © 2019 Rodrigo Cioletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var container: UICollectionView!
    @IBOutlet weak var indicator: NSLayoutConstraint!
    var vcs = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        container.delegate = self
        container.dataSource = self
        
        container.showsHorizontalScrollIndicator = false
        container.isPagingEnabled = true

        if let layout = container.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "view1"){
            vcs.append(vc)
        }
        if let vc = storyboard?.instantiateViewController(withIdentifier: "view2"){
            vcs.append(vc)
        }
        if let vc = storyboard?.instantiateViewController(withIdentifier: "view3"){
            vcs.append(vc)
        }
        if let vc = storyboard?.instantiateViewController(withIdentifier: "view4"){
            vcs.append(vc)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = container.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundView = vcs[indexPath.item].view
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        indicator.constant = scrollView.contentOffset.x / 4
    }
    
    func selectScreen(screen: Int){
        let indexPath = IndexPath(item: screen, section: 0)
        container.scrollToItem(at: indexPath, at: [] , animated: true)
    }
    
    @IBAction func touchHome(_ sender: Any) {
        selectScreen(screen: 0)
    }
    
    @IBAction func touchFire(_ sender: Any) {
        selectScreen(screen: 1)
    }
    
    @IBAction func touchSubs(_ sender: Any) {
        selectScreen(screen: 2)
    }
    
    @IBAction func touchAccount(_ sender: Any) {
        selectScreen(screen: 3)
    }
}
