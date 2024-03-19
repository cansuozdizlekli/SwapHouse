//
//  OnboardingCollectionViewCell.swift
//  HouseSwap
//
//  Created by Cansu Özdizlekli on 2/6/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    private var slideTitleLabel: UILabel = {
        var label = UILabel()
        label = UILabel(frame: CGRect(x: 0, y: UIScreen.screenHeight * 0.6, width: UIScreen.screenWidth, height: 90))
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor.primaryBlue
        label.backgroundColor = .white
        label.cornerRadius = 40
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.layer.masksToBounds = true
        return label
    }()
    
    private var slideDescriptionLabel: UILabel = {
        var label = UILabel()
        label = UILabel(frame: CGRect(x: 15, y: UIScreen.screenHeight * 0.6 + 20, width: UIScreen.screenWidth - 30, height: 200))
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    
    private var slideImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.6 + 50))
        imageView.layer.zPosition = -1
        return imageView
    }()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var identifier: String {
            return String(describing: self)
        }
        
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(slideTitleLabel)
        contentView.addSubview(slideDescriptionLabel)
        contentView.addSubview(slideImageView)
        contentView.clipsToBounds = true
//        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(_ slide :OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }

    
    

}
