//
//  CustomHeader.swift
//  PhysioSync
//
//  Created by Sanjeev Mehta on 13/06/24.
//

import UIKit

class CustomHeader: UIView {
    
    private let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let backBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Outfit-Bold", size: 20.0)!
        lbl.textColor = .black
        return lbl
    }()
    
    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let rightBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    var backButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        addSubview(backImageView)
        addSubview(titleLbl)
        addSubview(backBtn)
        addSubview(rightImageView)
        addSubview(rightBtn)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            backImageView.heightAnchor.constraint(equalToConstant: 20),
            backImageView.widthAnchor.constraint(equalToConstant: 20),
            
            backBtn.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor),
            backBtn.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor),
            backBtn.topAnchor.constraint(equalTo: backImageView.topAnchor),
            backBtn.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor),
            
            titleLbl.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            titleLbl.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            titleLbl.heightAnchor.constraint(equalToConstant: 80),
            
            
            rightImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rightImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            rightImageView.heightAnchor.constraint(equalToConstant: 20),
            rightImageView.widthAnchor.constraint(equalToConstant: 20),
            
            rightBtn.trailingAnchor.constraint(equalTo: rightImageView.trailingAnchor),
            rightBtn.leadingAnchor.constraint(equalTo: rightImageView.leadingAnchor),
            rightBtn.topAnchor.constraint(equalTo: rightImageView.topAnchor),
            rightBtn.bottomAnchor.constraint(equalTo: rightImageView.bottomAnchor)
        ])
        
        backBtn.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        rightBtn.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        
    }
    
    // MARK: - Methods
    func setTitle(_ text: String?) {
        titleLbl.text = text
    }
    
    func setIconImage(_ image: UIImage) {
        backImageView.image = image
    }
    
    func setRightImage(_ image: UIImage) {
        rightImageView.image = image
    }
    
    func setBackImage(_ image: UIImage) {
        backImageView.image = image
    }
    
    func showHideRightBtn(_ isShow: Bool) {
        if isShow {
            rightImageView.isHidden = false
            rightBtn.isHidden = false
        } else {
            rightImageView.isHidden = true
            rightBtn.isHidden = true
        }
    }
    
    @objc private func backButtonPressed() {
        backButtonAction?()
    }
    
    @objc private func rightButtonPressed() {
        rightButtonAction?()
    }
}