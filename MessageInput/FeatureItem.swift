
import UIKit

class FeatureItem: UIView {
    
    private let buttonView = SimpleButton()
    
    private let imageView = UIImageView()
    private let titleView = UILabel()
    
    var onClick: (() -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String, image: UIImage, configuration: Configuration) {

        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = configuration.featureItemButtonBackgroundColorNormal
        buttonView.layer.cornerRadius = configuration.featureItemButtonBorderRadius
        buttonView.layer.borderWidth = configuration.featureItemButtonBorderWidth
        buttonView.layer.borderColor = configuration.featureItemButtonBorderColor.cgColor
        buttonView.onClick = {
            self.onClick?()
        }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = configuration.featureItemTitleTextFont
        titleView.textColor = configuration.featureItemTitleTextColor
        titleView.numberOfLines = 1
        titleView.lineBreakMode = .byTruncatingTail
        titleView.textAlignment = .center
        titleView.text = title
        titleView.sizeToFit()

        addSubview(buttonView)
        addSubview(imageView)
        addSubview(titleView)
        
        addConstraints([
            NSLayoutConstraint(item: buttonView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: buttonView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: buttonView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: buttonView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: configuration.featureItemButtonWidth),
            NSLayoutConstraint(item: buttonView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: configuration.featureItemButtonHeight),
            
            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: buttonView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: buttonView, attribute: .centerY, multiplier: 1, constant: 0),
            
            NSLayoutConstraint(item: titleView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titleView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titleView, attribute: .top, relatedBy: .equal, toItem: buttonView, attribute: .bottom, multiplier: 1, constant: configuration.featureItemTitleTextMarginTop),
            NSLayoutConstraint(item: titleView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
    }
    
}
