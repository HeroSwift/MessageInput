
import UIKit
import EmotionInput

@objc public protocol MessageInputDelegate {
    
    // 发送语音
    func messageInputDidSendAudio(audioPath: String, audioDuration: Int)
    
    // 发送表情
    func messageInputDidSendEmotion(emotion: Emotion)
    
    // 发送文本
    func messageInputDidSendText(text: String)
    
    // 拍照
    func messageInputDidSendPhoto(photo: ImageFile)
    
    // 录制视频
    func messageInputDidSendVideo(videoPath: String, videoDuration: Int, thumbnail: ImageFile)
    
    // 点击图片按钮
    func messageInputDidClickPhotoFeature()
    
    // 抬起
    func messageInputDidLift()
    
    // 落下
    func messageInputDidFall()
    
}

public extension MessageInputDelegate {
    
    func messageInputDidSendAudio(audioPath: String, audioDuration: Int) { }
    
    func messageInputDidSendEmotion(emotion: Emotion) { }
    
    func messageInputDidSendText(text: String) { }
    
    func messageInputDidSendPhoto(photo: ImageFile) { }
    
    func messageInputDidSendVideo(videoPath: String, videoDuration: Int, thumbnail: ImageFile) { }
    
    func messageInputDidClickPhotoFeature() { }
    
    func messageInputDidLift() { }
    
    func messageInputDidFall() { }
    
}
