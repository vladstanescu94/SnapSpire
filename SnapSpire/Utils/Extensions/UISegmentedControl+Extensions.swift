import SwiftUI

extension UISegmentedControl {
    func defaultConfig(font: UIFont = UIFont.italicSystemFont(ofSize: 16), color: UIColor = UIColor(.placeholder)) {
        let defaultAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color,
        ]
        setTitleTextAttributes(defaultAttributes, for: .normal)
    }

    func selectedConfig(font: UIFont = UIFont.boldSystemFont(ofSize: 16), color: UIColor = UIColor(.primary)) {
        let selectedAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color,
        ]
        setTitleTextAttributes(selectedAttributes, for: .selected)
    }

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}
