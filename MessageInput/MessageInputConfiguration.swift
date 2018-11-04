
import UIKit

// 配置
public class MessageInputConfiguration {
    
    // 输入栏的边框大小
    var inputBarBorderWidth = 1 / UIScreen.main.scale
    
    // 输入栏的边框颜色
    var inputBarBorderColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    
    // 输入栏的背景颜色
    var inputBarBackgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    
    // 输入栏的水平内边距
    var inputBarPaddingHorizontal: CGFloat = 10

    // 输入栏的垂直内边距
    var inputBarPaddingVertical: CGFloat = 6
    
    // 输入栏每一项的间距
    var inputBarItemSpacing: CGFloat = 8
    
    // 圆形按钮的半径
    var circleButtonRadius: CGFloat = 15
    
    // 圆形按钮底部与输入框底部的距离
    var circleButtonMarginBottom: CGFloat = 4
    
    // 语音按钮图片
    var voiceButtonImage = UIImage(named: "speech_normal")
    
    // 表情按钮图片
    var emotionButtonImage = UIImage(named: "emotion_normal")
    
    // 更多按钮图片
    var moreButtonImage = UIImage(named: "more_normal")
    
    // 内容面板的背景色
    public var contentPanelBackgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    
    // 特性面板内边距
    public var featurePanelPaddingHorizontal: CGFloat = 30
    public var featurePanelPaddingVertical: CGFloat = 30
    
    // 特性按钮之间的间距
    public var featureItemSpacing: CGFloat = 25
    
    // 图标按钮尺寸
    public var featureItemButtonWidth: CGFloat = 50
    public var featureItemButtonHeight: CGFloat = 50
    
    // 按钮背景色
    public var featureItemButtonBackgroundColorNormal: UIColor = .white
    public var featureItemButtonBackgroundColorPressed: UIColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    
    // 图标按钮边框
    public var featureItemButtonBorderRadius: CGFloat = 8
    public var featureItemButtonBorderWidth: CGFloat = 1 / UIScreen.main.scale
    public var featureItemButtonBorderColor = UIColor(red: 160 / 255, green: 160 / 255, blue: 160 / 255, alpha: 160 / 255)
    
    // 特性按钮标题
    public var featureItemTitleTextMarginTop: CGFloat = 8
    public var featureItemTitleTextFont = UIFont.systemFont(ofSize: 12)
    public var featureItemTitleTextColor = UIColor(red: 120 / 255, green: 120 / 255, blue: 120 / 255, alpha: 1)
    
    // 图片按钮
    public var photoImage = UIImage(named: "image")!
    
    public var photoText = "图片"
    
    // 拍摄按钮
    public var cameraImage = UIImage(named: "camera")!
    
    public var cameraText = "拍摄"

    // 默认的键盘高度
    public var defaultKeyboardHeight: CGFloat = 258
    
    // 键盘显示、隐藏的动画时长
    public var keyboardAnimationDuration: TimeInterval = 0.2
    
    
    public init() { }
    
}
