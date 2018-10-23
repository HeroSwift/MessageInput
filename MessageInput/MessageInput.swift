
import UIKit

public class MessageInput: UIView {

    private let inputBarTopBorder = UIView()
    private let inputBarBottomBorder = UIView()
    
    private let voiceButton = CircleView()
    private let textView = UITextView()
    private let emotionButton = CircleView()
    private let moreButton = CircleView()
    
    private let contentPanel = UIView()
    
    private let morePanel = UIView()
    
    var textViewHeightConstraint: NSLayoutConstraint!
    var contentPanelHeightConstraint: NSLayoutConstraint!
    
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
    
    public func hideKeyboard() {
        textView.resignFirstResponder()
    }
    
}

extension MessageInput {
    
    private func addInputBar() {
        
        backgroundColor = configuration.inputBarBackgroundColor
        
        addInputBarTopBorder()
        addVoiceButton()
        addMoreButton()
        addEmotionButton()
        addTextView()
        addInputBarBottomBorder()
        
    }
    
    private func addInputBarTopBorder() {
        
        inputBarTopBorder.backgroundColor = configuration.inputBarBorderColor
        inputBarTopBorder.translatesAutoresizingMaskIntoConstraints = false
        addSubview(inputBarTopBorder)
        
        addConstraints([
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: configuration.inputBarBorderWidth),
        ])
        
    }
    
    private func addInputBarBottomBorder() {
        
        inputBarBottomBorder.backgroundColor = configuration.inputBarBorderColor
        inputBarBottomBorder.translatesAutoresizingMaskIntoConstraints = false
        addSubview(inputBarBottomBorder)
        
        addConstraints([
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .top, relatedBy: .equal, toItem: voiceButton, attribute: .bottom, multiplier: 1, constant: configuration.inputBarPaddingVertical),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: configuration.inputBarBorderWidth),
        ])
        
    }
    
    private func addVoiceButton() {
        
        voiceButton.centerRadius = configuration.circleButtonRadius
        voiceButton.centerImage = configuration.voiceButtonImage
        voiceButton.ringWidth = 0
        voiceButton.trackWidth = 0
        
        voiceButton.sizeToFit()
        voiceButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(voiceButton)
        
        addConstraints([
            NSLayoutConstraint(item: voiceButton, attribute: .top, relatedBy: .equal, toItem: inputBarTopBorder, attribute: .bottom, multiplier: 1, constant: configuration.inputBarPaddingVertical),
            NSLayoutConstraint(item: voiceButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: configuration.inputBarPaddingHorizontal),
        ])
        
    }
    
    private func addMoreButton() {
        
        moreButton.centerRadius = configuration.circleButtonRadius
        moreButton.centerImage = configuration.moreButtonImage
        moreButton.ringWidth = 0
        moreButton.trackWidth = 0
        
        moreButton.sizeToFit()
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.delegate = self
        
        addSubview(moreButton)
        
        addConstraints([
            NSLayoutConstraint(item: moreButton, attribute: .top, relatedBy: .equal, toItem: inputBarTopBorder, attribute: .bottom, multiplier: 1, constant: configuration.inputBarPaddingVertical),
            NSLayoutConstraint(item: moreButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -configuration.inputBarPaddingHorizontal),
        ])
        
    }
    
    
    private func addEmotionButton() {
        
        emotionButton.centerRadius = configuration.circleButtonRadius
        emotionButton.centerImage = configuration.emotionButtonImage
        emotionButton.ringWidth = 0
        emotionButton.trackWidth = 0
        
        emotionButton.sizeToFit()
        emotionButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(emotionButton)
        
        addConstraints([
            NSLayoutConstraint(item: emotionButton, attribute: .top, relatedBy: .equal, toItem: inputBarTopBorder, attribute: .bottom, multiplier: 1, constant: configuration.inputBarPaddingVertical),
            NSLayoutConstraint(item: emotionButton, attribute: .right, relatedBy: .equal, toItem: moreButton, attribute: .left, multiplier: 1, constant: -configuration.inputBarItemSpacing),
        ])
        
    }

    private func addTextView() {
        
        textView.text = "text"
        textView.backgroundColor = .gray
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.sizeToFit()
        addSubview(textView)
        
        textViewHeightConstraint = NSLayoutConstraint(item: textView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 16)
        
        addConstraints([
            NSLayoutConstraint(item: textView, attribute: .top, relatedBy: .equal, toItem: inputBarTopBorder, attribute: .bottom, multiplier: 1, constant: configuration.inputBarPaddingVertical),
            NSLayoutConstraint(item: textView, attribute: .left, relatedBy: .equal, toItem: voiceButton, attribute: .right, multiplier: 1, constant: configuration.inputBarItemSpacing),
            NSLayoutConstraint(item: textView, attribute: .right, relatedBy: .equal, toItem: emotionButton, attribute: .left, multiplier: 1, constant: -configuration.inputBarItemSpacing),
            textViewHeightConstraint
        ])
        
    }
    
    private func addContentPanel() {
        
        contentPanel.backgroundColor = configuration.contentPanelBackgroundColor
        contentPanel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentPanel)

        contentPanelHeightConstraint = NSLayoutConstraint(item: contentPanel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
        
        addConstraints([
            NSLayoutConstraint(item: contentPanel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentPanel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentPanel, attribute: .top, relatedBy: .equal, toItem: inputBarBottomBorder, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentPanel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            contentPanelHeightConstraint
        ])
        
        addMorePanel()
        
    }
    
    func addMorePanel() {
        
        morePanel.translatesAutoresizingMaskIntoConstraints = false
        contentPanel.addSubview(morePanel)
        
        let imageFeature = FeatureItem(title: "图片", image: UIImage(named: "image")!, configuration: configuration, onClick: {
            self.openPhotoBrowser()
        })
        imageFeature.translatesAutoresizingMaskIntoConstraints = false
        morePanel.addSubview(imageFeature)
        
        let cameraFeature = FeatureItem(title: "拍摄", image: UIImage(named: "camera")!, configuration: configuration, onClick: {
            self.openPhotoBrowser()
        })
        cameraFeature.translatesAutoresizingMaskIntoConstraints = false
        morePanel.addSubview(cameraFeature)
        
        addConstraints([
            NSLayoutConstraint(item: morePanel, attribute: .left, relatedBy: .equal, toItem: contentPanel, attribute: .left, multiplier: 1, constant: configuration.featurePanelPaddingHorizontal),
            NSLayoutConstraint(item: morePanel, attribute: .right, relatedBy: .equal, toItem: contentPanel, attribute: .right, multiplier: 1, constant: configuration.featurePanelPaddingHorizontal),
            NSLayoutConstraint(item: morePanel, attribute: .top, relatedBy: .equal, toItem: contentPanel, attribute: .top, multiplier: 1, constant: configuration.featurePanelPaddingVertical),
            NSLayoutConstraint(item: morePanel, attribute: .bottom, relatedBy: .equal, toItem: contentPanel, attribute: .bottom, multiplier: 1, constant: configuration.featurePanelPaddingVertical),
            
            NSLayoutConstraint(item: imageFeature, attribute: .top, relatedBy: .equal, toItem: morePanel, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imageFeature, attribute: .left, relatedBy: .equal, toItem: morePanel, attribute: .left, multiplier: 1.0, constant: 0),
            
            NSLayoutConstraint(item: cameraFeature, attribute: .top, relatedBy: .equal, toItem: morePanel, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: cameraFeature, attribute: .left, relatedBy: .equal, toItem: morePanel, attribute: .left, multiplier: 1.0, constant: configuration.featureItemButtonWidth + configuration.featureItemSpacing),
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
// MARK: - 处理软键盘显示和隐藏
//

extension MessageInput {
    
    @objc func onKeyboardShown(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            
            contentPanelHeightConstraint.constant = keyboardHeight * 2
            
            UITextView.animate(withDuration: 0.2, animations: {
                self.layoutIfNeeded()
            })
        }
        
    }
    
    @objc func onKeyboardHiden(notification: NSNotification) {
        
        contentPanelHeightConstraint.constant = 0
        
        UITextView.animate(withDuration: 0.2, animations: {
            self.layoutIfNeeded()
        })
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
        print(circleView)
    }
    
    public func circleViewDidTouchUp(_ circleView: CircleView, _ inside: Bool) {
        if circleView == moreButton {
            hideKeyboard()
        }
    }
    
    public func circleViewDidTouchEnter(_ circleView: CircleView) {
        
    }
    
    public func circleViewDidTouchLeave(_ circleView: CircleView) {
        
    }
    
    public func circleViewDidTouchMove(_ circleView: CircleView, _ x: CGFloat, _ y: CGFloat) {
        
    }
    
}
