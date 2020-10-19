//
//  HorizontalCell.swift
//  tableviewInsideCollectionView
//
//  Created by mac on 10/14/20.
//  Copyright © 2020 Esat Gozcu. All rights reserved.
//

import UIKit

class HorizontalCell: UITableViewCell {
    
    let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let width = UIScreen.main.bounds.size.width/2.5
        layout.estimatedItemSize = CGSize(width: width, height: 1)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let height = CollectionViewCell.height(width: width)
        layout.itemSize = CGSize(width:width, height: height)
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCollectionView()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func setupCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView.dataSource = self
    }
    
    private func setupUI() {
        self.contentView.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}

//MARK:- UICollectionView Datasource methods
extension HorizontalCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
}
