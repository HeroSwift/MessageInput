
import UIKit
import EmotionInput

public protocol MessageInputDelegate {
    
    // 发送语音
    func messageInputDidSendAudio(_ messageInput: MessageInput, audioPath: String, audioDuration: TimeInterval)
    
    // 发送表情
    func messageInputDidSendEmotion(_ messageInput: MessageInput, emotion: Emotion)
    
    // 发送文本
    func messageInputDidSendText(_ messageInput: MessageInput, text: String)
    
    // 选择照片
    func messageInputDidSendImage(_ messageInput: MessageInput, images: [Image])
    
    // 拍照
    func messageInputDidSendPhoto(_ messageInput: MessageInput, photo: Image)
    
    // 录制视频
    func messageInputDidSendVideo(_ messageInput: MessageInput, videoPath: String, videoDuration: TimeInterval, thumbnail: Image)
    
    // 抬起
    func messageInputDidLift(_ messageInput: MessageInput)
    
    // 落下
    func messageInputDidFall(_ messageInput: MessageInput)
    
}

public extension MessageInputDelegate {
    
    func messageInputDidSendAudio(_ messageInput: MessageInput, audioPath: String, audioDuration: TimeInterval) { }
    
    func messageInputDidSendEmotion(_ messageInput: MessageInput, emotion: Emotion) { }
    
    func messageInputDidSendText(_ messageInput: MessageInput, text: String) { }
    
    func messageInputDidSendImage(_ messageInput: MessageInput, images: [Image]) { }
    
    func messageInputDidSendPhoto(_ messageInput: MessageInput, photo: Image) { }
    
    func messageInputDidSendVideo(_ messageInput: MessageInput, videoPath: String, videoDuration: TimeInterval, thumbnail: Image) { }
    
    func messageInputDidLift(_ messageInput: MessageInput) { }
    
    func messageInputDidFall(_ messageInput: MessageInput) { }
    
}
