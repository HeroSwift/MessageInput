
import UIKit

// 配置
public class MessageInputConfiguration {
    
    // 输入栏的边框大小
    public var inputBarBorderWidth = 1 / UIScreen.main.scale
    
    // 输入栏的边框颜色
    public var inputBarBorderColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    
    // 输入栏的背景颜色
    public var inputBarBackgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    
    // 输入栏的水平内边距
    public var inputBarPaddingHorizontal: CGFloat = 10

    // 输入栏的垂直内边距
    public var inputBarPaddingVertical: CGFloat = 6
    
    // 输入栏每一项的间距
    public var inputBarItemSpacing: CGFloat = 8
    
    // 圆形按钮的半径
    public var circleButtonRadius: CGFloat = 15
    
    // 圆形按钮的边框大小
    public var circleButtonBorderWidth = 1 / UIScreen.main.scale
    
    // 圆形按钮的边框颜色
    public var circleButtonBorderColor = UIColor(red: 0.56, green: 0.56, blue: 0.56, alpha: 1)
    
    // 圆形按钮的默认背景色
    public var circleButtonBackgroundColorNormal = UIColor.white
    
    // 圆形按钮按下时的背景色
    public var circleButtonBackgroundColorPressed = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
    
    // 圆形按钮底部与输入框底部的距离
    public var circleButtonMarginBottom: CGFloat = 4
    
    // 语音按钮图片
    public var voiceButtonImage = UIImage(named: "voice", in: Bundle(for: MessageInputConfiguration.self), compatibleWith: nil)
    
    // 表情按钮图片
    public var emotionButtonImage = UIImage(named: "emotion", in: Bundle(for: MessageInputConfiguration.self), compatibleWith: nil)
    
    // 更多按钮图片
    public var moreButtonImage = UIImage(named: "more", in: Bundle(for: MessageInputConfiguration.self), compatibleWith: nil)
    
    // 键盘按钮图片
    public var keyboardButtonImage = UIImage(named: "keyboard", in: Bundle(for: MessageInputConfiguration.self), compatibleWith: nil)

    // 内容面板的背景色
    public var contentPanelBackgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    
    // 特性面板内边距
    public var featurePanelPaddingHorizontal: CGFloat = 30
    public var featurePanelPaddingVertical: CGFloat = 30
    
    // 特性按钮之间的间距
    public var featureButtonSpacing: CGFloat = 25
    
    // 图标按钮尺寸
    public var featureButtonWidth: CGFloat = 50
    public var featureButtonHeight: CGFloat = 50
    
    // 按钮背景色
    public var featureButtonBackgroundColorNormal: UIColor = .white
    public var featureButtonBackgroundColorPressed: UIColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 225 / 255, alpha: 1)
    
    // 图标按钮边框
    public var featureButtonBorderRadius: CGFloat = 8
    public var featureButtonBorderWidth: CGFloat = 1 / UIScreen.main.scale
    public var featureButtonBorderColor = UIColor(red: 160 / 255, green: 160 / 255, blue: 160 / 255, alpha: 160 / 255)
    
    // 特性按钮标题
    public var featureButtonTitleMarginTop: CGFloat = 8
    public var featureButtonTitleTextFont = UIFont.systemFont(ofSize: 12)
    public var featureButtonTitleTextColor = UIColor(red: 120 / 255, green: 120 / 255, blue: 120 / 255, alpha: 1)
    
    // 图片按钮
    public var photoImage = UIImage(named: "image", in: Bundle(for: MessageInputConfiguration.self), compatibleWith: nil)!
    
    public var photoText = "图片"
    
    // 拍摄按钮
    public var cameraImage = UIImage(named: "camera", in: Bundle(for: MessageInputConfiguration.self), compatibleWith: nil)!
    
    public var cameraText = "拍摄"

    // 默认的键盘高度
    public var defaultKeyboardHeight: CGFloat = 258
    
    // 键盘显示、隐藏的动画时长
    public var keyboardAnimationDuration: TimeInterval = 0.2
    
    
    public init() { }
    
}
