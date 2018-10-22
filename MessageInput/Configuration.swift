
import UIKit

let Configuration_featureGrid_paddingHorizontal: CGFloat = 20
let Configuration_featureGrid_paddingVertical: CGFloat = 20
let Configuration_featureCell_spacingHorizontal: CGFloat = 20

// 图标按钮
let Configuration_featureItem_iconButtonWidth: CGFloat = 50
let Configuration_featureItem_iconButtonHeight: CGFloat = 50
let Configuration_featureItem_iconButtonBackgroundColorNormal: UIColor = .white
let Configuration_featureItem_iconButtonBackgroundColorPressed: UIColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
let Configuration_featureItem_iconButtonBorderWidth: CGFloat = 1 / UIScreen.main.scale
let Configuration_featureItem_iconButtonBorderColor: UIColor = UIColor(red: 160 / 255, green: 160 / 255, blue: 160 / 255, alpha: 160 / 255)
let Configuration_featureItem_iconButtonBorderRadius: CGFloat = 8

// 特性按钮文本与图标的距离
let Configuration_featureItem_titleTextMarginTop: CGFloat = 8

// 特性按钮文本字体
let Configuration_featureItem_titleTextFont: UIFont = UIFont.systemFont(ofSize: 12)

// 特性按钮文本颜色
let Configuration_featureItem_titleTextColor: UIColor = UIColor(red: 120 / 255, green: 120 / 255, blue: 120 / 255, alpha: 1)

public class Configuration {
    
    // 输入栏的边框大小
    var inputBarBorderWidth = 1 / UIScreen.main.scale
    
    // 输入栏的边框颜色
    var inputBarBorderColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    
    // 输入栏的背景颜色
    var inputBarBackgroundColor: UIColor = .white
    
    // 输入栏的水平内边距
    var inputBarPaddingHorizontal: CGFloat = 10

    // 输入栏的垂直内边距
    var inputBarPaddingVertical: CGFloat = 10
    
    // 输入栏每一项的间距
    var inputBarItemSpacing: CGFloat = 8
    
    // 圆形按钮的半径
    var circleButtonRadius: CGFloat = 15
    
    // 语音按钮图片
    var voiceButtonImage = UIImage(named: "speech_normal")
    
    // 表情按钮图片
    var emotionButtonImage = UIImage(named: "emotion_normal")
    
    // 更多按钮图片
    var moreButtonImage = UIImage(named: "more_normal")
    
    // 内容面板的背景色
    public var contentPanelBackgroundColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    
    public init() {}
}
