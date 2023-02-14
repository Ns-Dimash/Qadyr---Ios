//
//  LevelViewController.swift
//  Molitva
//
//  Created by Dimash Nsanbaev on 1/18/23.
//

import UIKit
import SnapKit

class LevelViewController: UIViewController {
    
    
    lazy private var levelImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "level2")
        return theImageView
     }()
    
    private var myLevel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "My Level: \(TasbihViewController.myScore)"
        label.font = UIFont(name: "times", size: 30)
        label.alpha = 1
        return label
    }()
    private var total:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "\(TasbihViewController.allAttempts)"
        label.font = UIFont(name: "times", size: 30)
        label.alpha = 1
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = "My LeveL"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(total)
        view.addSubview(levelImage)
        view.addSubview(myLevel)
        if TasbihViewController.allAttempts == 2{
            TasbihViewController.myScore  = TasbihViewController.myScore + 1
            print(TasbihViewController.myScore)
        }
        setupConstraints()
    }
    
    func setupConstraints(){
        levelImage.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.height.equalTo(170)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
        }
        myLevel.snp.makeConstraints { make in
            make.top.equalTo(levelImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(40)
        }
        total.snp.makeConstraints { make in
            make.top.equalTo(levelImage.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(40)
        }

    }

}
