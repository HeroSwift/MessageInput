
import UIKit
import EmotionInput

public protocol MessageInputDelegate {
    
    // 发送语音
    func messageInputDidSendAudio(audioPath: String, audioDuration: TimeInterval)
    
    // 发送表情
    func messageInputDidSendEmotion(emotion: Emotion)
    
    // 发送文本
    func messageInputDidSendText(text: String)
    
    // 选择照片
    func messageInputDidSendImages(images: [ImageFile])
    
    // 拍照
    func messageInputDidSendPhoto(photo: ImageFile)
    
    // 录制视频
    func messageInputDidSendVideo(videoPath: String, videoDuration: TimeInterval, thumbnail: ImageFile)
    
    // 抬起
    func messageInputDidLift()
    
    // 落下
    func messageInputDidFall()
    
}

public extension MessageInputDelegate {
    
    func messageInputDidSendAudio(audioPath: String, audioDuration: TimeInterval) { }
    
    func messageInputDidSendEmotion(emotion: Emotion) { }
    
    func messageInputDidSendText(text: String) { }
    
    func messageInputDidSendImages(images: [ImageFile]) { }
    
    func messageInputDidSendPhoto(photo: ImageFile) { }
    
    func messageInputDidSendVideo(videoPath: String, videoDuration: TimeInterval, thumbnail: ImageFile) { }
    
    func messageInputDidLift() { }
    
    func messageInputDidFall() { }
    
}
