
import UIKit
import EmotionInput

public protocol MessageInputDelegate {
    
    // 发送语音
    func messageInputDidSendVoice(_ messageInput: MessageInput, audioPath: String, audioDuration: TimeInterval)
    
    // 发送表情
    func messageInputDidSendEmotion(_ messageInput: MessageInput, emotion: Emotion)
    
    // 发送文本
    func messageInputDidSendText(_ messageInput: MessageInput, text: String)
    
    // 选择照片
    func messageInputDidSendImage(_ messageInput: MessageInput, imagePath: String, imageWidth: CGFloat, imageHeight: CGFloat)
    
    // 拍照
    func messageInputDidSendPhoto(_ messageInput: MessageInput, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat)
    
    // 录制视频
    func messageInputDidSendVideo(_ messageInput: MessageInput, videoPath: String, videoDuration: TimeInterval, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat)
    
}

public extension MessageInputDelegate {
    
    func messageInputDidSendVoice(_ messageInput: MessageInput, audioPath: String, audioDuration: TimeInterval) { }
    
    func messageInputDidSendEmotion(_ messageInput: MessageInput, emotion: Emotion) { }
    
    func messageInputDidSendText(_ messageInput: MessageInput, text: String) { }
    
    func messageInputDidSendImage(_ messageInput: MessageInput, imagePath: String, imageWidth: CGFloat, imageHeight: CGFloat) { }
    
    func messageInputDidSendPhoto(_ messageInput: MessageInput, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat) { }
    
    func messageInputDidSendVideo(_ messageInput: MessageInput, videoPath: String, videoDuration: TimeInterval, photoPath: String, photoWidth: CGFloat, photoHeight: CGFloat) { }
    
}
