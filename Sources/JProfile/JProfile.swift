import UIKit

import SnapKit
import RxCocoa
import RxSwift

@available(iOS 13.0, *)
open class JProfileView: UIView {
    
    private var profileImageView = UIImageView()
    public private(set) var profileImage: JProfileImage?
    private let profileType: JProfileType
    
    public init (
        profileImage: JProfileImage,
        profileType: JProfileType
    ) {
        self.profileImage = profileImage
        self.profileType = profileType
        
        super.init(frame: .zero)
        
        configureLayout()
        configureImage(with: profileImage)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        if let image = self.profileImage?.image {
            self.profileImageView.image = image
        }
        
        self.layer.cornerRadius = self.profileType.radius
        self.clipsToBounds = true
        
        self.snp.makeConstraints { make in
            make.width.height.equalTo(self.profileType.size)
        }
        
    }
    
    private func configureLayout() {
        addSubview(profileImageView)
    }
    
    public func configureImage(with junhaProfileImage: JProfileImage) {
        self.profileImage = junhaProfileImage
        
        switch junhaProfileImage.type {
        case .custom:
            if let customImg = junhaProfileImage.customImage {
                self.profileImageView.image = customImg
            } else {
                self.profileImageView.image = UIImage(systemName: "square.and.arrow.up")!
                self.backgroundColor = .gray
            }
        }
    }
}
