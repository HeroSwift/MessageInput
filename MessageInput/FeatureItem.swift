
import UIKit

class FeatureItem: UIView {
    
    private let iconButton = SimpleButton()
    
    private let imageView = UIImageView()
    private let titleView = UILabel()
    
    var onClick: (() -> Void)?
    
    var title: String? {
        didSet {
            titleView.text = title
            if title != nil {
                titleView.sizeToFit()
            }
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        let titleHeight = titleView.intrinsicContentSize.height
        return CGSize(
            width: Configuration_featureItem_iconButtonWidth,
            height: Configuration_featureItem_iconButtonHeight + Configuration_featureItem_titleTextMarginTop + titleHeight
        )
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {

        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.backgroundColor = Configuration_featureItem_iconButtonBackgroundColorNormal
        iconButton.layer.cornerRadius = Configuration_featureItem_iconButtonBorderRadius
        iconButton.layer.borderWidth = Configuration_featureItem_iconButtonBorderWidth
        iconButton.layer.borderColor = Configuration_featureItem_iconButtonBorderColor.cgColor
        iconButton.frame = CGRect(x: 0, y: 0, width: Configuration_featureItem_iconButtonWidth, height: Configuration_featureItem_iconButtonHeight)
        iconButton.onClick = {
            self.onClick?()
        }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = Configuration_featureItem_titleTextFont
        titleView.textColor = Configuration_featureItem_titleTextColor
        titleView.numberOfLines = 1
        titleView.lineBreakMode = .byTruncatingTail
        titleView.textAlignment = .center

        addSubview(iconButton)
        iconButton.addSubview(imageView)
        addSubview(titleView)
        
        addConstraints([
            NSLayoutConstraint(item: iconButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: iconButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: iconButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: Configuration_featureItem_iconButtonWidth),
            NSLayoutConstraint(item: iconButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: Configuration_featureItem_iconButtonHeight),
            
            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: iconButton, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: iconButton, attribute: .centerY, multiplier: 1.0, constant: 0),
            
            NSLayoutConstraint(item: titleView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: titleView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: titleView, attribute: .top, relatedBy: .equal, toItem: iconButton, attribute: .bottom, multiplier: 1.0, constant: Configuration_featureItem_titleTextMarginTop),
        ])
        
    }
    
}
