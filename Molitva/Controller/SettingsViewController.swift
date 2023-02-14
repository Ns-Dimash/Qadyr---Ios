//
//  SettingsViewController.swift
//  Molitva
//
//  Created by Dimash Nsanbaev on 1/23/23.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

    let devCousesImages = [UIImage(named: "Image1"), UIImage(named: "Image2"), UIImage(named: "Image3"), UIImage(named: "Image4"), UIImage(named: "Image5"), UIImage(named: "Image6"),UIImage(named: "launch")]
    
    private var backgroundImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 500)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Wallpapers"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(backgroundImageView)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        configureConstraints()
        
        
        
    }
    func configureConstraints(){
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
}

extension SettingsViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        
        switch indexPath.row{
        case 0 : cell.backgroundView = UIImageView(image:devCousesImages[0])
        case 1 : cell.backgroundView = UIImageView(image:devCousesImages[1])
        case 2 : cell.backgroundView = UIImageView(image:devCousesImages[2])
        case 3 : cell.backgroundView = UIImageView(image:devCousesImages[3])
        case 4 : cell.backgroundView = UIImageView(image:devCousesImages[4])
        case 5 : cell.backgroundView = UIImageView(image:devCousesImages[5])
        case 6 : cell.backgroundView = UIImageView(image:devCousesImages[6])
            
        default:
            return cell
        }
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devCousesImages.count - 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0 : TimeViewController.backgroundImageView.image = devCousesImages[0]
            backgroundImageView.image = devCousesImages[0]
            TasbihViewController.backgroundImageView.image = devCousesImages[0]
        case 1 : TimeViewController.backgroundImageView.image = devCousesImages[1]
            backgroundImageView.image = devCousesImages[1]
            TasbihViewController.backgroundImageView.image = devCousesImages[1]
        case 2 : TimeViewController.backgroundImageView.image = devCousesImages[2]
            backgroundImageView.image = devCousesImages[2]
            TasbihViewController.backgroundImageView.image = devCousesImages[2]
        case 3 : TimeViewController.backgroundImageView.image = devCousesImages[3]
            backgroundImageView.image = devCousesImages[3]
            TasbihViewController.backgroundImageView.image = devCousesImages[3]
        case 4 : TimeViewController.backgroundImageView.image = devCousesImages[4]
            backgroundImageView.image = devCousesImages[4]
//            SettingsViewController().navigationController?.navigationBar.tintColor = .black
//            self.navigationController?.navigationBar.tintColor = .black

            

            TasbihViewController.backgroundImageView.image = devCousesImages[4]
        case 5 : TimeViewController.backgroundImageView.image = devCousesImages[5]
            backgroundImageView.image = devCousesImages[5]
            TasbihViewController.backgroundImageView.image = devCousesImages[5]
        case 6 : TimeViewController.backgroundImageView.image = devCousesImages[6]
            backgroundImageView.image = devCousesImages[6]
            TasbihViewController.backgroundImageView.image = devCousesImages[6]

            
        default:TimeViewController.backgroundImageView.image = devCousesImages[5]
        }
    }
    
    
}

