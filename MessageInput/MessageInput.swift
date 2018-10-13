
import UIKit

public class MessageInput: UIView {

    private let inputBar = UIView()
    private let contentPanel = UIView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addInputBar()
        addContentPanel()
    }
}

extension MessageInput {
    
    private func addInputBar() {
        
        addSubview(inputBar)
        
    }
    
    private func addContentPanel() {
        addSubview(contentPanel)
    }
}
