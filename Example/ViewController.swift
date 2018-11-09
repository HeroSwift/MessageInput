//
//  ViewController.swift
//  Example
//
//  Created by zhujl on 2018/10/13.
//  Copyright © 2018年 finstao. All rights reserved.
//

import UIKit
import MessageInput
import EmotionInput

class ViewController: UIViewController {

    @IBAction func onClick(_ sender: Any) {
        print("onClick")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let input = MessageInput(configuration: MessageInputConfiguration())
        
        input.delegate = self
        input.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(input)
        
        let emotionList = [
            
            Emotion(code: "😄", name: "", imageAsset: UIImage(named: "emoji_1f604"), inline: true),
            Emotion(code: "😷", name: "", imageAsset: UIImage(named: "emoji_1f637"), inline: true),
            Emotion(code: "😂", name: "", imageAsset: UIImage(named: "emoji_1f602"), inline: true),
            Emotion(code: "😝", name: "", imageAsset: UIImage(named: "emoji_1f61d"), inline: true),
            Emotion(code: "😳", name: "", imageAsset: UIImage(named: "emoji_1f633"), inline: true),
            Emotion(code: "😱", name: "", imageAsset: UIImage(named: "emoji_1f631"), inline: true),
            Emotion(code: "😔", name: "", imageAsset: UIImage(named: "emoji_1f614"), inline: true),
            Emotion(code: "😒", name: "", imageAsset: UIImage(named: "emoji_1f612"), inline: true),
            Emotion(code: "🤗", name: "", imageAsset: UIImage(named: "emoji_1f917"), inline: true),
            Emotion(code: "🙂", name: "", imageAsset: UIImage(named: "emoji_1f642"), inline: true),
            Emotion(code: "😊", name: "", imageAsset: UIImage(named: "emoji_1f60a"), inline: true),
            Emotion(code: "😋", name: "", imageAsset: UIImage(named: "emoji_1f60b"), inline: true),
            Emotion(code: "😌", name: "", imageAsset: UIImage(named: "emoji_1f60c"), inline: true),
            Emotion(code: "😍", name: "", imageAsset: UIImage(named: "emoji_1f60d"), inline: true),
            Emotion(code: "😎", name: "", imageAsset: UIImage(named: "emoji_1f60e"), inline: true),
            Emotion(code: "😪", name: "", imageAsset: UIImage(named: "emoji_1f62a"), inline: true),
            Emotion(code: "😓", name: "", imageAsset: UIImage(named: "emoji_1f613"), inline: true),
            Emotion(code: "😭", name: "", imageAsset: UIImage(named: "emoji_1f62d"), inline: true),
            Emotion(code: "😘", name: "", imageAsset: UIImage(named: "emoji_1f618"), inline: true),
            Emotion(code: "😏", name: "", imageAsset: UIImage(named: "emoji_1f60f"), inline: true),
            Emotion(code: "😚", name: "", imageAsset: UIImage(named: "emoji_1f61a"), inline: true),
            Emotion(code: "😛", name: "", imageAsset: UIImage(named: "emoji_1f61b"), inline: true),
            Emotion(code: "😜", name: "", imageAsset: UIImage(named: "emoji_1f61c"), inline: true),
            
            
            Emotion(code: "💪", name: "", imageAsset: UIImage(named: "emoji_1f4aa"), inline: true),
            Emotion(code: "👊", name: "", imageAsset: UIImage(named: "emoji_1f44a"), inline: true),
            Emotion(code: "👍", name: "", imageAsset: UIImage(named: "emoji_1f44d"), inline: true),
            Emotion(code: "🤘", name: "", imageAsset: UIImage(named: "emoji_1f918"), inline: true),
            Emotion(code: "👏", name: "", imageAsset: UIImage(named: "emoji_1f44f"), inline: true),
            Emotion(code: "👋", name: "", imageAsset: UIImage(named: "emoji_1f44b"), inline: true),
            Emotion(code: "🙌", name: "", imageAsset: UIImage(named: "emoji_1f64c"), inline: true),
            Emotion(code: "🖐", name: "", imageAsset: UIImage(named: "emoji_1f590"), inline: true),
            Emotion(code: "🖖", name: "", imageAsset: UIImage(named: "emoji_1f596"), inline: true),
            Emotion(code: "👎", name: "", imageAsset: UIImage(named: "emoji_1f44e"), inline: true),
            Emotion(code: "🙏", name: "", imageAsset: UIImage(named: "emoji_1f64f"), inline: true),
            Emotion(code: "👌", name: "", imageAsset: UIImage(named: "emoji_1f44c"), inline: true),
            Emotion(code: "👈", name: "", imageAsset: UIImage(named: "emoji_1f448"), inline: true),
            Emotion(code: "👉", name: "", imageAsset: UIImage(named: "emoji_1f449"), inline: true),
            Emotion(code: "👆", name: "", imageAsset: UIImage(named: "emoji_1f446"), inline: true),
            Emotion(code: "👇", name: "", imageAsset: UIImage(named: "emoji_1f447"), inline: true),
            Emotion(code: "🎃", name: "", imageAsset: UIImage(named: "emoji_1f383"), inline: true),
            Emotion(code: "👀", name: "", imageAsset: UIImage(named: "emoji_1f440"), inline: true),
            Emotion(code: "👃", name: "", imageAsset: UIImage(named: "emoji_1f443"), inline: true),
            Emotion(code: "👄", name: "", imageAsset: UIImage(named: "emoji_1f444"), inline: true),
            Emotion(code: "👂", name: "", imageAsset: UIImage(named: "emoji_1f442"), inline: true),
            Emotion(code: "👻", name: "", imageAsset: UIImage(named: "emoji_1f47b"), inline: true),
            Emotion(code: "💋", name: "", imageAsset: UIImage(named: "emoji_1f48b"), inline: true),
            
            
            
            Emotion(code: "😞", name: "", imageAsset: UIImage(named: "emoji_1f61e"), inline: true),
            Emotion(code: "😟", name: "", imageAsset: UIImage(named: "emoji_1f61f"), inline: true),
            Emotion(code: "😫", name: "", imageAsset: UIImage(named: "emoji_1f62b"), inline: true),
            Emotion(code: "😮", name: "", imageAsset: UIImage(named: "emoji_1f62e"), inline: true),
            Emotion(code: "😯", name: "", imageAsset: UIImage(named: "emoji_1f62f"), inline: true),
            Emotion(code: "😉", name: "", imageAsset: UIImage(named: "emoji_1f609"), inline: true),
            Emotion(code: "😡", name: "", imageAsset: UIImage(named: "emoji_1f621"), inline: true),
            Emotion(code: "😢", name: "", imageAsset: UIImage(named: "emoji_1f622"), inline: true),
            Emotion(code: "😣", name: "", imageAsset: UIImage(named: "emoji_1f623"), inline: true),
            Emotion(code: "😤", name: "", imageAsset: UIImage(named: "emoji_1f624"), inline: true),
            Emotion(code: "😥", name: "", imageAsset: UIImage(named: "emoji_1f625"), inline: true),
            Emotion(code: "😧", name: "", imageAsset: UIImage(named: "emoji_1f627"), inline: true),
            Emotion(code: "😨", name: "", imageAsset: UIImage(named: "emoji_1f628"), inline: true),
            Emotion(code: "😩", name: "", imageAsset: UIImage(named: "emoji_1f629"), inline: true),
            Emotion(code: "😲", name: "", imageAsset: UIImage(named: "emoji_1f632"), inline: true),
            Emotion(code: "😴", name: "", imageAsset: UIImage(named: "emoji_1f634"), inline: true),
            Emotion(code: "😵", name: "", imageAsset: UIImage(named: "emoji_1f635"), inline: true),
            Emotion(code: "🙄", name: "", imageAsset: UIImage(named: "emoji_1f644"), inline: true),
            Emotion(code: "🤒", name: "", imageAsset: UIImage(named: "emoji_1f912"), inline: true),
            Emotion(code: "🤓", name: "", imageAsset: UIImage(named: "emoji_1f913"), inline: true),
            Emotion(code: "🤔", name: "", imageAsset: UIImage(named: "emoji_1f914"), inline: true),
            
        ]
        
        input.setEmotionSetList([
            EmotionSet.build(iconAsset: UIImage(named: "emoji_icon")!, emotionList: emotionList, columns: 8, rows: 3, width: 24, height: 24, hasDeleteButton: true, hasIndicator: true)
        ])
        
        input.addEmotionFilter(EmojiFilter(emotionList: emotionList))

        view.addConstraints([
            NSLayoutConstraint(item: input, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: input, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: input, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: MessageInputDelegate {
    
    func messageInputDidSendVoice(_ messageInput: MessageInput, audioPath: String, audioDuration: TimeInterval) {
        print("send voice  \(audioPath) \(audioDuration)")
    }
    
    func messageInputDidSendEmotion(_ messageInput: MessageInput, emotion: Emotion) {
        print("send emotion  \(emotion.code)")
    }
    
    func messageInputDidSendText(_ messageInput: MessageInput, text: String) {
        print("send text  \(text)")
    }
    
    func messageInputDidSendImage(_ messageInput: MessageInput, imagePath: String, imageWidth: CGFloat, imageHeight: CGFloat) {
        print("send image  \(imagePath) \(imageWidth) \(imageHeight)")
    }
    
    func messageInputDidSendPhoto(_ messageInput: MessageInput, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat) {
        print("send photo  \(photoPath) \(photoWidth) \(photoHeight)")
    }
    
    func messageInputDidSendVideo(_ messageInput: MessageInput, videoPath: String, videoDuration: TimeInterval, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat) {
        print("send video  \(videoPath) \(videoDuration)  \(photoPath) \(photoWidth) \(photoHeight)")
    }
    
}


