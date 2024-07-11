import UIKit

class ProfileViewController: UIViewController {

    private let headerView: ProfileHeaderView = {
        let headerView = ProfileHeaderView()
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(headerView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.backgroundColor = .lightGray
        let safeArea = self.view.safeAreaLayoutGuide
        let headerHeight: CGFloat = 200
        let headerFrame = CGRect(x: 0,
                                    y: safeArea.layoutFrame.minY,
                                    width: safeArea.layoutFrame.width,
                                    height: headerHeight)
        headerView.frame = headerFrame
    }
}
