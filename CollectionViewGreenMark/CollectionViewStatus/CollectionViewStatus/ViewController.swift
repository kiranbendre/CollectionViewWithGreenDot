//
//  ViewController.swift
//  CollectionViewStatus
//
//  Created by Iphone XR on 31/12/22.
//

import UIKit

class ViewController: UIViewController {

    var collectionView:UICollectionView?
    
    var nameArray = ["Virat Kohli","Sachin Tendulkar","Hardik Pandya","Rohit sharma","Rishabh pant","Virendra shehwag","Harbajan singh","Yuveaj singh"]
    
    var favoriteCriketer = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        self.navigationItem.title = "Criketer List"
//
//        let BarButtonItem = UIBarButtonItem(title: "Sort Favorite", style: .done, target: self, action: #selector(selectBtnAction))
//            self.navigationItem.rightBarButtonItem  = BarButtonItem

        //MARK: Layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        //MARK: Register XIB
          collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        //MARK: Give background color using RGB
        collectionView.backgroundColor = UIColor(red: 33.0/255, green: 40.0/255, blue: 64.0/255, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
    }
//    @objc func selectBtnAction(_ sender: UIButton!){
//        print("btn clicked")
////        for item in favoriteCriketer{
////            //print(nameArray[Int(item)!])
////            print(nameArray)
////        }
//    }
//    private func blankFavoriteCriketer(){
//        for i in 0...nameArray.count{
//            favoriteCriketer[i]=false
//        }
//    }

}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as? CollectionViewCell else {
//
//            return UICollectionViewCell()
//        }
//        cell.nameLabel.text = nameArray[indexPath.row]
//        cell.statusImage.image = UIImage(named:nameArray[indexPath.row])
//
//        cell.backgroundColor = UIColor(red: 63.0/255, green: 70.0/255, blue: 100.0/255, alpha: 1.0)
        
//        if nameArray[indexPath.row] == "active"{
//            cell.statusImage.backgroundColor = UIColor.systemGray
//        }else{
//            cell.statusImage.backgroundColor = UIColor.green
//        }
//
//
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as! CollectionViewCell
       
        if favoriteCriketer[indexPath.row] == true
        {
            cell.statusImage.backgroundColor = UIColor.green
            cell.nameLabel.text = nameArray[indexPath.row]
            cell.backgroundColor = UIColor(red: 63.0/255, green: 70.0/255, blue: 100.0/255, alpha: 1.0)
        }else{
            cell.statusImage.backgroundColor = UIColor.systemGray
            cell.nameLabel.text = nameArray[indexPath.row]
            cell.backgroundColor = UIColor(red: 63.0/255, green: 70.0/255, blue: 100.0/255, alpha: 1.0)
        }
       
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)as! CollectionViewCell
        cell.statusImage.backgroundColor = UIColor.green
        favoriteCriketer[indexPath.row] = true
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)as! CollectionViewCell
        cell.statusImage.backgroundColor = UIColor.systemGray
        favoriteCriketer[indexPath.row] = false
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:350, height: 130 )
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 15
    }
}
