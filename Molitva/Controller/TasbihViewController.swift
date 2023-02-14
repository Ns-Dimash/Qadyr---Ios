//
//  TasbihViewController.swift
//  Molitva
//
//  Created by Dimash Nsanbaev on 1/17/23.
//

import UIKit
import SnapKit

class TasbihViewController: UIViewController {
    
    var prog = 0.0
    var res = 1
    static var myScore = 0
    static var allAttempts = 0
    
    // MARK: - CREATING UI
    
    
    
    static var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image1")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var word:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "سُبْحَانَ ٱللَّٰهِ‎"
        label.font = UIFont(name: "times", size: 40)
        label.alpha = 1
        return label
        
    }()
    
    private var number:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: "times", size: 30)
        label.alpha = 1
        return label
        
    }()
    
    lazy private var tasbih: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.alpha = 0.5
        button.layer.cornerRadius = 100
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy private var reset: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.alpha = 0.5
        button.layer.cornerRadius = 35
        button.addTarget(self, action: #selector(didReset), for: .touchUpInside)
        return button
    }()
    
    lazy private var progressView:UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = .black
        progress.progressTintColor = .white
        progress.clipsToBounds = true
        progress.layer.cornerRadius = 5
        progress.layer.borderColor = UIColor.white.cgColor
        progress.layer.borderWidth = 1
        return progress
    }()
    
    // MARK: - @OBJC FUNC

    @objc func didTap(){
        print("Dimash")
        number.text = "\(res)"
        prog = prog + 0.01
        res = res + 1
        
        progressView.setProgress(Float(prog), animated: false)
        
        
        if res == 34{
            view.backgroundColor = .systemPink
            word.text = "الحمد لله"
        }
        else if res == 67{
            view.backgroundColor = .systemYellow
            word.text = "الله أكبر"
        }
        else if res == 99{
            word.text = "الله أكبر"
        }
        else if res == 100{
            number.text = ""
            res=1
            prog = 0.0
            word.text = "سُبْحَانَ ٱللَّٰهِ‎"
            TasbihViewController.allAttempts = TasbihViewController.allAttempts + 1
//            print(TasbihViewController.allAttempts)
        }
        
        
    }
    
    @objc func didReset(){
        number.text = ""
        res=1
        prog = 0.0
        word.text = "سُبْحَانَ ٱللَّٰهِ‎"
        progressView.progress = 0
        
    }
    @objc func didTaped(){
        let setVc = SettingsViewController()
        navigationController?.pushViewController(setVc, animated: true)
        
    }
    
    @objc func levelUp(){
        let medalVC = LevelViewController()
        let navVC = UINavigationController(rootViewController: medalVC)
        present(navVC,animated: true)
    }
    
    // MARK: - MAIN

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(TasbihViewController.backgroundImageView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "medal", image: UIImage(systemName: "medal.fill"), target: self, action: #selector(levelUp))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "gear", image: UIImage(systemName: "gear"), target: self, action: #selector(didTaped))
        navigationController?.navigationBar.tintColor = .label
        view.addSubview(tasbih)
        view.addSubview(reset)
        view.addSubview(number)
        view.addSubview(word)
        view.addSubview(progressView)
        
        setupConstraints()
    }
    
    
    // MARK: - CONSTRAINTS

    
    private func setupConstraints(){
        TasbihViewController.backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tasbih.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        reset.snp.makeConstraints { make in
            make.top.equalTo(tasbih.snp.bottom)
            make.leading.equalToSuperview().inset(240)
            make.width.height.equalTo(70)
        }
        word.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.centerX.equalToSuperview()
        }
        number.snp.makeConstraints { make in
            make.top.equalTo(230)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(700)
            make.height.equalTo(10)
            make.width.equalToSuperview().inset(50)
            
            make.centerX.equalToSuperview()
        }
    }
}
