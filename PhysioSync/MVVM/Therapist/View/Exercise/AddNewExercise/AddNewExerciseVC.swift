//
//  AddNewExerciseVC.swift
//  PhysioSync
//
//  Created by Rohit on 2024-06-13.
//

import UIKit

class AddNewExerciseVC: UIViewController {

    // MARK: - IBOutlets
       @IBOutlet weak var collectionView: UICollectionView!
       @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    // MARK: - Variables
       var categoryArr = [categoryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setHeader("Add New Exercise", isRightBtn: false) {
            self.dismissOrPopViewController()
        } rightButtonAction: {
            // not in use
        }
    }
    
    // MARK: - Set Data
    func setData() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5 // Adjust as needed for horizontal spacing
        layout.minimumLineSpacing = 5 // Adjust as needed for vertical spacing
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "ChipsCVC", bundle: nil), forCellWithReuseIdentifier: "ChipsCVC")
        categoryArr.append(categoryData(name: "Neck", isSelected: false))
        categoryArr.append(categoryData(name: "Core", isSelected: false))
        categoryArr.append(categoryData(name: "Arm", isSelected: false))
        categoryArr.append(categoryData(name: "Upper Back", isSelected: false))
        collectionView.reloadData()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.collectionHeight.constant = self.collectionView.contentSize.height
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionHeight.constant = collectionView.contentSize.height
    }
}

extension AddNewExerciseVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipsCVC", for: indexPath) as! ChipsCVC
        let data = categoryArr[indexPath.item]
        cell.titleLbl.text = data.name
        if categoryArr[indexPath.item].isSelected {
            cell.bgView.backgroundColor = .black
        } else {
            cell.bgView.backgroundColor = .blue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if categoryArr[indexPath.item].isSelected {
            categoryArr[indexPath.item].isSelected = false
        } else {
            categoryArr[indexPath.item].isSelected = true
        }
        collectionView.reloadData()
    }
    
}