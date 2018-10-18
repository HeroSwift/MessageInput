
import UIKit

public class MessageInput: UIView {

    private let inputBar = UIView()
    private let inputBarTopBorder = UIView()
    private let inputBarBottomBorder = UIView()
    
    private let voiceButton = CircleView()
    private let textView = UITextView()
    private let emotionButton = CircleView()
    private let moreButton = CircleView()
    
    private let contentPanel = UIView()
    
    private let morePanel = UIView()
    
    var inputBarBorderWidth = 1 / UIScreen.main.scale
    var inputBarBorderColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    var inputBarBackgroundColor: UIColor = .white
    
    var inputBarPaddingVertical: CGFloat = 10
    var inputBarPaddingHorizontal: CGFloat = 10
    
    var inputBarItemSpacing: CGFloat = 8
    
    
    var voiceButtonRadius = CGFloat(15)
    var voiceButtonImage = UIImage(named: "speech_normal")
    
    var emotionButtonRadius = CGFloat(15)
    var emotionButtonImage = UIImage(named: "emotion_normal")
    
    var moreButtonRadius = CGFloat(15)
    var moreButtonImage = UIImage(named: "more_normal")
    
    private var isContentPanelHidden = true
    private var configuration: Configuration!
    
    public convenience init(configuration: Configuration) {
        self.init()
        self.configuration = Configuration()
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        backgroundColor = UIColor.gray
        addInputBar()
        addContentPanel()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardShown(notification:)),
            name: .UIKeyboardWillShow,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardHiden(notification:)),
            name: .UIKeyboardWillHide,
            object: nil
        )
     
    }
    
    @objc func onKeyboardShown(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            isContentPanelHidden = false
            invalidateIntrinsicContentSize()
            
            UITextView.animate(withDuration: 0.1, animations: {
                let frame = self.contentPanel.frame
                self.contentPanel.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.size.width, height: keyboardHeight))
            })
        }
        
    }
    
    @objc func onKeyboardHiden(notification: NSNotification) {
        
        isContentPanelHidden = true
        invalidateIntrinsicContentSize()
        
    }
    
}

extension MessageInput {
    
    private func addInputBar() {
        
        inputBarTopBorder.backgroundColor = inputBarBorderColor
        inputBarTopBorder.translatesAutoresizingMaskIntoConstraints = false
        
        inputBar.backgroundColor = inputBarBackgroundColor
        inputBar.translatesAutoresizingMaskIntoConstraints = false
        
        inputBarBottomBorder.backgroundColor = inputBarBorderColor
        inputBarBottomBorder.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(inputBarTopBorder)
        addSubview(inputBar)
        addSubview(inputBarBottomBorder)
        
        addConstraints([
            
            // top border
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: inputBarBorderWidth),
            
            // input bar
            NSLayoutConstraint(item: inputBar, attribute: .top, relatedBy: .equal, toItem: inputBarTopBorder, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBar, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBar, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: voiceButtonRadius * 2 + inputBarPaddingVertical * 2),
            
            // bottom border
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .top, relatedBy: .equal, toItem: inputBar, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: inputBarBorderWidth),
            
        ])
        
        addVoiceButton()
        addMoreButton()
        addEmotionButton()
        addTextView()
        
    }
    
    private func addVoiceButton() {
        
        voiceButton.centerRadius = voiceButtonRadius
        voiceButton.centerImage = voiceButtonImage
        voiceButton.ringWidth = 0
        voiceButton.trackWidth = 0
        
        voiceButton.sizeToFit()
        voiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        inputBar.addSubview(voiceButton)
        
        addConstraints([
            NSLayoutConstraint(item: voiceButton, attribute: .centerY, relatedBy: .equal, toItem: inputBar, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: voiceButton, attribute: .left, relatedBy: .equal, toItem: inputBar, attribute: .left, multiplier: 1.0, constant: inputBarPaddingHorizontal),
        ])
        
    }
    
    private func addEmotionButton() {
        
        emotionButton.centerRadius = emotionButtonRadius
        emotionButton.centerImage = emotionButtonImage
        emotionButton.ringWidth = 0
        emotionButton.trackWidth = 0
        
        emotionButton.sizeToFit()
        emotionButton.translatesAutoresizingMaskIntoConstraints = false
        
        inputBar.addSubview(emotionButton)
        
        addConstraints([
            NSLayoutConstraint(item: emotionButton, attribute: .centerY, relatedBy: .equal, toItem: inputBar, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: emotionButton, attribute: .right, relatedBy: .equal, toItem: moreButton, attribute: .left, multiplier: 1.0, constant: -inputBarItemSpacing),
        ])
        
    }
    
    private func addMoreButton() {
        
        moreButton.centerRadius = moreButtonRadius
        moreButton.centerImage = moreButtonImage
        moreButton.ringWidth = 0
        moreButton.trackWidth = 0
        
        moreButton.sizeToFit()
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        inputBar.addSubview(moreButton)
        
        addConstraints([
            NSLayoutConstraint(item: moreButton, attribute: .centerY, relatedBy: .equal, toItem: inputBar, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: moreButton, attribute: .right, relatedBy: .equal, toItem: inputBar, attribute: .right, multiplier: 1.0, constant: -inputBarPaddingHorizontal),
        ])
        
    }
    
    private func addTextView() {
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "123123"
        inputBar.addSubview(textView)
        
        addConstraints([
            NSLayoutConstraint(item: textView, attribute: .centerY, relatedBy: .equal, toItem: inputBar, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: textView, attribute: .left, relatedBy: .equal, toItem: voiceButton, attribute: .right, multiplier: 1.0, constant: inputBarItemSpacing),
            NSLayoutConstraint(item: textView, attribute: .right, relatedBy: .equal, toItem: emotionButton, attribute: .left, multiplier: 1.0, constant: -inputBarItemSpacing),
            NSLayoutConstraint(item: textView, attribute: .bottom, relatedBy: .equal, toItem: inputBar, attribute: .bottom, multiplier: 1.0, constant: -inputBarPaddingVertical),
        ])
        
    }
    
    private func addContentPanel() {
        
        contentPanel.backgroundColor = .red
        contentPanel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentPanel)

        addConstraints([
            NSLayoutConstraint(item: contentPanel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentPanel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentPanel, attribute: .top, relatedBy: .equal, toItem: inputBarBottomBorder, attribute: .bottom, multiplier: 1.0, constant: 0),
        ])
        
        addMorePanel()
        
    }
    
    func addMorePanel() {
        
        morePanel.backgroundColor = .blue
        morePanel.translatesAutoresizingMaskIntoConstraints = false
        contentPanel.addSubview(morePanel)
        
        let imageFeature = FeatureItem()
        imageFeature.translatesAutoresizingMaskIntoConstraints = false
        imageFeature.title = "图片"
        imageFeature.image = UIImage(named: "image")
        imageFeature.onClick = {
            self.openPhotoBrowser()
        }
        morePanel.addSubview(imageFeature)
        
        let cameraFeature = FeatureItem()
        cameraFeature.translatesAutoresizingMaskIntoConstraints = false
        cameraFeature.title = "拍摄"
        cameraFeature.image = UIImage(named: "camera")
        morePanel.addSubview(cameraFeature)
        
        addConstraints([
            NSLayoutConstraint(item: morePanel, attribute: .left, relatedBy: .equal, toItem: contentPanel, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: morePanel, attribute: .right, relatedBy: .equal, toItem: contentPanel, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: morePanel, attribute: .top, relatedBy: .equal, toItem: contentPanel, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: morePanel, attribute: .bottom, relatedBy: .equal, toItem: contentPanel, attribute: .bottom, multiplier: 1.0, constant: 0),
            
            NSLayoutConstraint(item: imageFeature, attribute: .top, relatedBy: .equal, toItem: morePanel, attribute: .top, multiplier: 1.0, constant: Configuration_featureGrid_paddingVertical),
            NSLayoutConstraint(item: imageFeature, attribute: .left, relatedBy: .equal, toItem: morePanel, attribute: .left, multiplier: 1.0, constant: Configuration_featureGrid_paddingHorizontal),
            
            NSLayoutConstraint(item: cameraFeature, attribute: .top, relatedBy: .equal, toItem: morePanel, attribute: .top, multiplier: 1.0, constant: Configuration_featureGrid_paddingVertical),
            NSLayoutConstraint(item: cameraFeature, attribute: .left, relatedBy: .equal, toItem: morePanel, attribute: .left, multiplier: 1.0, constant: Configuration_featureGrid_paddingHorizontal + imageFeature.intrinsicContentSize.width + Configuration_featureCell_spacingHorizontal),
        ])
        
    }
    
    
    
    public override func layoutSubviews() {
        
    }
    
    func openPhotoBrowser() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        
        UIApplication.shared.keyWindow?.rootViewController?.present(imagePickerController, animated: true, completion: nil)
        
    }
    
}

//
// MARK: - UIImagePickerController 代理
//

extension MessageInput: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        

//
        picker.dismiss(animated: true, completion: nil)
//
        

    }
}

//
// MARK: - 圆形按钮的事件响应
//

extension MessageInput: CircleViewDelegate {
    
    public func circleViewDidTouchDown(_ circleView: CircleView) {
        
    }
    
    public func circleViewDidTouchUp(_ circleView: CircleView, _ inside: Bool) {
        if circleView == moreButton {
            
        }
    }
    
    public func circleViewDidTouchEnter(_ circleView: CircleView) {
        
    }
    
    public func circleViewDidTouchLeave(_ circleView: CircleView) {
        
    }
    
    public func circleViewDidTouchMove(_ circleView: CircleView, _ x: CGFloat, _ y: CGFloat) {
        
    }
    
}
