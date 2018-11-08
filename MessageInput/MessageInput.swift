
import UIKit

import CircleView
import CameraView
import VoiceInput
import EmotionInput

import Photos

public class MessageInput: UIView {

    public var delegate: MessageInputDelegate!
    
    private let inputBarTopBorder = UIView()
    private let inputBarBottomBorder = UIView()
    
    private let voiceButton = CircleView()
    private let textView = EmotionTextarea(configuration: EmotionTextareaConfiguration())
    private let emotionButton = CircleView()
    private let moreButton = CircleView()
    
    private let contentPanel = UIView()
    
    private let voicePanel = VoiceInput(configuration: VoiceInputConfiguration())
    private let emotionPanel = EmotionPager(configuration: EmotionPagerConfiguration())
    private let morePanel = UIView()
    
    private var cameraViewController: CameraViewController?
    
    private var keyboardHeight: CGFloat!
    private var textViewHeightConstraint: NSLayoutConstraint!
    private var contentPanelHeightConstraint: NSLayoutConstraint!
    private var contentPanelBottomConstraint: NSLayoutConstraint!
    
    private var configuration: MessageInputConfiguration!
    
    public convenience init(configuration: MessageInputConfiguration) {
        self.init()
        self.configuration = configuration
        self.keyboardHeight = configuration.defaultKeyboardHeight
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        addContentPanel()
        addInputBar()
        
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
    
    public func showKeyboard() {
        
        textView.becomeFirstResponder()

    }
    
    public func hideKeyboard() {

        textView.resignFirstResponder()
        
    }
    
    public func showVoicePanel() {
        
        voicePanel.isHidden = false
        emotionPanel.isHidden = true
        morePanel.isHidden = true
        
        voiceButton.centerImage = configuration.keyboardButtonImage
        voiceButton.setNeedsDisplay()
        
        if emotionButton.centerImage == configuration.keyboardButtonImage {
            emotionButton.centerImage = configuration.emotionButtonImage
            emotionButton.setNeedsDisplay()
        }
        
        if moreButton.centerImage == configuration.keyboardButtonImage {
            moreButton.centerImage = configuration.moreButtonImage
            moreButton.setNeedsDisplay()
        }
        
        hideKeyboard()
        showContentPanel()
        
    }
    
    public func showEmotionPanel() {
        
        voicePanel.isHidden = true
        emotionPanel.isHidden = false
        morePanel.isHidden = true
        
        emotionButton.centerImage = configuration.keyboardButtonImage
        emotionButton.setNeedsDisplay()
        
        if voiceButton.centerImage == configuration.keyboardButtonImage {
            voiceButton.centerImage = configuration.voiceButtonImage
            voiceButton.setNeedsDisplay()
        }
        
        if moreButton.centerImage == configuration.keyboardButtonImage {
            moreButton.centerImage = configuration.moreButtonImage
            moreButton.setNeedsDisplay()
        }
        
        hideKeyboard()
        showContentPanel()
        
    }
    
    public func showMorePanel() {
        
        voicePanel.isHidden = true
        emotionPanel.isHidden = true
        morePanel.isHidden = false
        
        moreButton.centerImage = configuration.keyboardButtonImage
        moreButton.setNeedsDisplay()
        
        if voiceButton.centerImage == configuration.keyboardButtonImage {
            voiceButton.centerImage = configuration.voiceButtonImage
            voiceButton.setNeedsDisplay()
        }
        
        if emotionButton.centerImage == configuration.keyboardButtonImage {
            emotionButton.centerImage = configuration.emotionButtonImage
            emotionButton.setNeedsDisplay()
        }
        
        hideKeyboard()
        showContentPanel()
        
    }
    
    public func showContentPanel() {
        
        guard contentPanelBottomConstraint.constant > 0 else {
            return
        }
        
        contentPanelBottomConstraint.constant = 0

        UIView.animate(
            withDuration: configuration.keyboardAnimationDuration,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.layoutIfNeeded()
            },
            completion: nil
        )
        
    }
    
    public func hideContentPanel() {
        
        guard contentPanelBottomConstraint.constant == 0 else {
            return
        }

        contentPanelBottomConstraint.constant = keyboardHeight

        UIView.animate(
            withDuration: configuration.keyboardAnimationDuration,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.layoutIfNeeded()
            },
            completion: { finished in
                self.resetButtons()
                self.resetPanels()
            }
        )
        
    }
    
    public func setEmotionSetList(_ emotionSetList: [EmotionSet]) {
        emotionPanel.emotionSetList = emotionSetList
    }
    
    public func addEmotionFilter(_ emotionFilter: EmotionFilter) {
        textView.addFilter(emotionFilter)
    }
    
    public func removeEmotionFilter(_ emotionFilter: EmotionFilter) {
        textView.removeFilter(emotionFilter)
    }
    
    private func resetPanels() {
        
        voicePanel.isHidden = true
        emotionPanel.isHidden = true
        morePanel.isHidden = true
        
    }
    
    private func resetButtons() {
        
        if voiceButton.centerImage == configuration.keyboardButtonImage {
            voiceButton.centerImage = configuration.voiceButtonImage
            voiceButton.setNeedsDisplay()
        }
        
        if emotionButton.centerImage == configuration.keyboardButtonImage {
            emotionButton.centerImage = configuration.emotionButtonImage
            emotionButton.setNeedsDisplay()
        }
        
        if moreButton.centerImage == configuration.keyboardButtonImage {
            moreButton.centerImage = configuration.moreButtonImage
            moreButton.setNeedsDisplay()
        }
        
    }
    
}

extension MessageInput {
    
    private func addInputBar() {
        
        backgroundColor = configuration.inputBarBackgroundColor
        
        // 从下往上添加
        addInputBarBottomBorder()
        
        addVoiceButton()
        addMoreButton()
        addEmotionButton()
        addTextView()
        
        addInputBarTopBorder()
        
    }

    private func addInputBarBottomBorder() {
        
        inputBarBottomBorder.backgroundColor = configuration.inputBarBorderColor
        inputBarBottomBorder.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(inputBarBottomBorder)
        
        addConstraints([
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .bottom, relatedBy: .equal, toItem: contentPanel, attribute: .top, multiplier: 1, constant: -configuration.inputBarBorderWidth),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarBottomBorder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: configuration.inputBarBorderWidth),
        ])
        
    }
    
    private func addVoiceButton() {
        
        voiceButton.centerImage = configuration.voiceButtonImage
        voiceButton.centerRadius = configuration.circleButtonRadius - configuration.circleButtonBorderWidth
        voiceButton.centerColor = configuration.circleButtonBackgroundColorNormal
        voiceButton.ringWidth = configuration.circleButtonBorderWidth
        voiceButton.ringColor = configuration.circleButtonBorderColor
        voiceButton.trackWidth = 0
        
        voiceButton.translatesAutoresizingMaskIntoConstraints = false
        voiceButton.delegate = self
        
        addSubview(voiceButton)
        
        addConstraints([
            NSLayoutConstraint(item: voiceButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: configuration.inputBarPaddingHorizontal),
            NSLayoutConstraint(item: voiceButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 2 * configuration.circleButtonRadius),
            NSLayoutConstraint(item: voiceButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 2 * configuration.circleButtonRadius),
            NSLayoutConstraint(item: voiceButton, attribute: .bottom, relatedBy: .equal, toItem: inputBarBottomBorder, attribute: .top, multiplier: 1, constant: -(configuration.inputBarPaddingVertical + configuration.circleButtonMarginBottom)),
        ])
        
    }
    
    private func addMoreButton() {
        
        moreButton.centerImage = configuration.moreButtonImage
        moreButton.centerRadius = configuration.circleButtonRadius - configuration.circleButtonBorderWidth
        moreButton.centerColor = configuration.circleButtonBackgroundColorNormal
        moreButton.ringWidth = configuration.circleButtonBorderWidth
        moreButton.ringColor = configuration.circleButtonBorderColor
        moreButton.trackWidth = 0
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.delegate = self
        
        addSubview(moreButton)
        
        addConstraints([
            NSLayoutConstraint(item: moreButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -configuration.inputBarPaddingHorizontal),
            NSLayoutConstraint(item: moreButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 2 * configuration.circleButtonRadius),
            NSLayoutConstraint(item: moreButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 2 * configuration.circleButtonRadius),
            NSLayoutConstraint(item: moreButton, attribute: .bottom, relatedBy: .equal, toItem: inputBarBottomBorder, attribute: .top, multiplier: 1, constant: -(configuration.inputBarPaddingVertical + configuration.circleButtonMarginBottom)),
        ])
        
    }
    
    
    private func addEmotionButton() {
        
        emotionButton.centerImage = configuration.emotionButtonImage
        emotionButton.centerRadius = configuration.circleButtonRadius - configuration.circleButtonBorderWidth
        emotionButton.centerColor = configuration.circleButtonBackgroundColorNormal
        emotionButton.ringWidth = configuration.circleButtonBorderWidth
        emotionButton.ringColor = configuration.circleButtonBorderColor
        emotionButton.trackWidth = 0
        
        emotionButton.translatesAutoresizingMaskIntoConstraints = false
        emotionButton.delegate = self
        
        addSubview(emotionButton)
        
        addConstraints([
            NSLayoutConstraint(item: emotionButton, attribute: .right, relatedBy: .equal, toItem: moreButton, attribute: .left, multiplier: 1, constant: -configuration.inputBarItemSpacing),
            NSLayoutConstraint(item: emotionButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 2 * configuration.circleButtonRadius),
            NSLayoutConstraint(item: emotionButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 2 * configuration.circleButtonRadius),
            NSLayoutConstraint(item: emotionButton, attribute: .bottom, relatedBy: .equal, toItem: inputBarBottomBorder, attribute: .top, multiplier: 1, constant: -(configuration.inputBarPaddingVertical + configuration.circleButtonMarginBottom)),
        ])
        
    }

    private func addTextView() {
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textView)
        
        addConstraints([
            NSLayoutConstraint(item: textView, attribute: .left, relatedBy: .equal, toItem: voiceButton, attribute: .right, multiplier: 1, constant: configuration.inputBarItemSpacing),
            NSLayoutConstraint(item: textView, attribute: .right, relatedBy: .equal, toItem: emotionButton, attribute: .left, multiplier: 1, constant: -configuration.inputBarItemSpacing),
            NSLayoutConstraint(item: textView, attribute: .bottom, relatedBy: .equal, toItem: inputBarBottomBorder, attribute: .top, multiplier: 1, constant: -configuration.inputBarPaddingVertical),
        ])

    }
    
    private func addInputBarTopBorder() {
        
        inputBarTopBorder.backgroundColor = configuration.inputBarBorderColor
        inputBarTopBorder.translatesAutoresizingMaskIntoConstraints = false
        addSubview(inputBarTopBorder)
        
        addConstraints([
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .bottom, relatedBy: .equal, toItem: textView, attribute: .top, multiplier: 1, constant: -configuration.inputBarPaddingVertical),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: inputBarTopBorder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: configuration.inputBarBorderWidth),
        ])
        
    }
    
    private func addContentPanel() {
        
        contentPanel.backgroundColor = configuration.contentPanelBackgroundColor
        contentPanel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentPanel)

        contentPanelHeightConstraint = NSLayoutConstraint(item: contentPanel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: keyboardHeight)
        
        contentPanelBottomConstraint = NSLayoutConstraint(item: contentPanel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: keyboardHeight)
        
        addConstraints([
            NSLayoutConstraint(item: contentPanel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentPanel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
            contentPanelBottomConstraint,
            contentPanelHeightConstraint
        ])
        
        addVoicePanel()
        addEmotionPanel()
        addMorePanel()
        
    }
    
    private func addVoicePanel() {
        
        voicePanel.delegate = self
        voicePanel.isHidden = true
        voicePanel.translatesAutoresizingMaskIntoConstraints = false
        contentPanel.addSubview(voicePanel)
        
        addConstraints([
            NSLayoutConstraint(item: voicePanel, attribute: .left, relatedBy: .equal, toItem: contentPanel, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: voicePanel, attribute: .right, relatedBy: .equal, toItem: contentPanel, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: voicePanel, attribute: .top, relatedBy: .equal, toItem: contentPanel, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: voicePanel, attribute: .bottom, relatedBy: .equal, toItem: contentPanel, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
    }
    
    private func addEmotionPanel() {
        
        emotionPanel.isHidden = true
        emotionPanel.translatesAutoresizingMaskIntoConstraints = false

        emotionPanel.onSendClick = {
            let text = self.textView.plainText
            if text != "" {
                self.delegate.messageInputDidSendText(self, text: text)
                self.textView.clear()
            }
        }
        emotionPanel.onEmotionClick = { emotion in
            if emotion.inline {
                self.textView.insertEmotion(emotion)
            }
            else {
                self.delegate.messageInputDidSendEmotion(self, emotion: emotion)
            }
        }
        emotionPanel.onDeleteClick = {
            self.textView.deleteBackward()
        }
        contentPanel.addSubview(emotionPanel)

        addConstraints([
            NSLayoutConstraint(item: emotionPanel, attribute: .left, relatedBy: .equal, toItem: contentPanel, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: emotionPanel, attribute: .right, relatedBy: .equal, toItem: contentPanel, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: emotionPanel, attribute: .top, relatedBy: .equal, toItem: contentPanel, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: emotionPanel, attribute: .bottom, relatedBy: .equal, toItem: contentPanel, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
    }
    
    private func addMorePanel() {
        
        morePanel.isHidden = true
        morePanel.translatesAutoresizingMaskIntoConstraints = false
        contentPanel.addSubview(morePanel)
        
        let imageFeature = FeatureItem(title: configuration.photoText, image: configuration.photoImage, configuration: configuration, onClick: {
            self.openPhotoPicker()
        })
        imageFeature.translatesAutoresizingMaskIntoConstraints = false
        morePanel.addSubview(imageFeature)
        
        let cameraFeature = FeatureItem(title: configuration.cameraText, image: configuration.cameraImage, configuration: configuration, onClick: {
            self.openCamera()
        })
        cameraFeature.translatesAutoresizingMaskIntoConstraints = false
        morePanel.addSubview(cameraFeature)
        
        addConstraints([
            NSLayoutConstraint(item: morePanel, attribute: .left, relatedBy: .equal, toItem: contentPanel, attribute: .left, multiplier: 1, constant: configuration.featurePanelPaddingHorizontal),
            NSLayoutConstraint(item: morePanel, attribute: .right, relatedBy: .equal, toItem: contentPanel, attribute: .right, multiplier: 1, constant: -configuration.featurePanelPaddingHorizontal),
            NSLayoutConstraint(item: morePanel, attribute: .top, relatedBy: .equal, toItem: contentPanel, attribute: .top, multiplier: 1, constant: configuration.featurePanelPaddingVertical),
            NSLayoutConstraint(item: morePanel, attribute: .bottom, relatedBy: .equal, toItem: contentPanel, attribute: .bottom, multiplier: 1, constant: -configuration.featurePanelPaddingVertical),

            NSLayoutConstraint(item: imageFeature, attribute: .top, relatedBy: .equal, toItem: morePanel, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageFeature, attribute: .left, relatedBy: .equal, toItem: morePanel, attribute: .left, multiplier: 1, constant: 0),

            NSLayoutConstraint(item: cameraFeature, attribute: .top, relatedBy: .equal, toItem: morePanel, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: cameraFeature, attribute: .left, relatedBy: .equal, toItem: morePanel, attribute: .left, multiplier: 1, constant: configuration.featureItemButtonWidth + configuration.featureItemSpacing),
        ])
        
    }
    
    private func requestPhotoPermissions(completion: @escaping (Bool) -> Void) {
        
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    completion(status == .authorized)
                }
            }
        }
        else {
            completion(true)
        }
        
    }
    
    func openPhotoPicker() {
        
        guard let parentViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        
        requestPhotoPermissions { authorized in
            if authorized {
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .photoLibrary
                
                parentViewController.present(imagePickerController, animated: true, completion: nil)
            }
        }
        
    }
    
    func openCamera() {
        
        guard let parentViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        
        let cameraViewController = CameraViewController()
        
        cameraViewController.configuration = CameraViewConfiguration()
        cameraViewController.delegate = self
        
        parentViewController.present(cameraViewController, animated: true, completion: nil)
        
        self.cameraViewController = cameraViewController
        
    }
    
}

//
// MARK: - 处理软键盘显示和隐藏
//

extension MessageInput {
    
    @objc func onKeyboardShown(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            // 保存，方便设置 voicePanel/emotionPanel/morePanel 的高度
            keyboardHeight = keyboardFrame.cgRectValue.height
            
            contentPanelHeightConstraint.constant = keyboardHeight

            if voicePanel.isHidden && emotionPanel.isHidden && morePanel.isHidden {
                showContentPanel()
            }
            else {
                Timer.scheduledTimer(
                    timeInterval: configuration.keyboardAnimationDuration,
                    target: self,
                    selector: #selector(onKeyboardAppear),
                    userInfo: nil,
                    repeats: false
                )
            }
            
        }
        
    }
    
    @objc func onKeyboardHiden(notification: NSNotification) {
        
        guard voicePanel.isHidden, emotionPanel.isHidden, morePanel.isHidden else {
            return
        }
        
        hideContentPanel()
        
    }
    
    @objc func onKeyboardAppear() {
        
        resetButtons()
        resetPanels()
        
    }
    
}

//
// MARK: - VoiceInputDelegate 代理
//

extension MessageInput: VoiceInputDelegate {
    
    public func voiceInputDidFinishRecord(_ voiceInput: VoiceInput, audioPath: String, audioDuration: TimeInterval) {
        delegate.messageInputDidSendVoice(self, audioPath: audioPath, audioDuration: audioDuration)
    }
    
}

//
// MARK: - CameraViewDelegate 代理
//

extension MessageInput: CameraViewDelegate {
    
    public func cameraViewDidExit(_ cameraView: CameraView) {
        cameraViewController?.dismiss(animated: true, completion: nil)
    }
    
    public func cameraViewDidPickPhoto(_ cameraView: CameraView, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat) {
        cameraViewController?.dismiss(animated: true, completion: nil)
        delegate.messageInputDidSendPhoto(self, photoPath: photoPath, photoWidth: photoWidth, photoHeight: photoHeight)
    }
    
    public func cameraViewDidPickVideo(_ cameraView: CameraView, videoPath: String, videoDuration: TimeInterval, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat) {
        cameraViewController?.dismiss(animated: true, completion: nil)
        delegate.messageInputDidSendVideo(self, videoPath: videoPath, videoDuration: videoDuration, photoPath: photoPath, photoWidth: photoWidth, photoHeight: photoHeight)
    }
    
    public func cameraViewWillCaptureWithoutPermissions(_ cameraView: CameraView) {
        
    }
    
    public func cameraViewDidRecordDurationLessThanMinDuration(_ cameraView: CameraView) {
        
    }
    
    public func cameraViewDidPermissionsGranted(_ cameraView: CameraView) {
        
    }
    
    public func cameraViewDidPermissionsDenied(_ cameraView: CameraView) {
        
    }
    
}

//
// MARK: - UIImagePickerController 代理
//

extension MessageInput: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let imageWidth = pickedImage.size.width
            let imageHeight = pickedImage.size.height
            
            delegate.messageInputDidSendImage(self, imagePath: "", imageWidth: imageWidth, imageHeight: imageHeight)
            
        }
            
    }
}

//
// MARK: - 圆形按钮的事件响应
//

extension MessageInput: CircleViewDelegate {
    
    public func circleViewDidTouchDown(_ circleView: CircleView) {
        circleView.centerColor = configuration.circleButtonBackgroundColorPressed
        circleView.setNeedsDisplay()
    }
    
    public func circleViewDidTouchUp(_ circleView: CircleView, _ inside: Bool, _ isLongPress: Bool) {
        
        if inside {
            if circleView == voiceButton {
                if voicePanel.isHidden {
                    showVoicePanel()
                }
                else {
                    showKeyboard()
                }
            }
            else if circleView == emotionButton {
                if emotionPanel.isHidden {
                    showEmotionPanel()
                }
                else {
                    showKeyboard()
                }
            }
            else if circleView == moreButton {
                if morePanel.isHidden {
                    showMorePanel()
                }
                else {
                    showKeyboard()
                }
            }
        }
        
        circleView.centerColor = configuration.circleButtonBackgroundColorNormal
        circleView.setNeedsDisplay()
    }
    
    public func circleViewDidTouchEnter(_ circleView: CircleView) {
        circleView.centerColor = configuration.circleButtonBackgroundColorPressed
        circleView.setNeedsDisplay()
    }
    
    public func circleViewDidTouchLeave(_ circleView: CircleView) {
        circleView.centerColor = configuration.circleButtonBackgroundColorNormal
        circleView.setNeedsDisplay()
    }
    
}
