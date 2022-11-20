//
//  TitleConnectionView.swift
//  netflixapp
//
//  Created by Kholod Sultan on 26/04/1444 AH.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell{
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView:UIImageView = {
        imageview.contentMode = .scaleAspectFit
        return imageview
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    public func configure(with model: String){
        
        guard   let url = URL(string: model) else {return}
        posterImageView.sd_setImage(with: url , completed:nil)
    }
}
