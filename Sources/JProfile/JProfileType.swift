import Foundation
import UIKit

public enum JProfileType {
    case smallProfile
    case middleProfile
    case bigProfile
    case maxProfile
    case intro
    case bage
    
    var size: CGFloat {
        switch self {
        case .smallProfile:
            return 36.0
        case .middleProfile:
            return 40.0
        case .bigProfile:
            return 48.0
        case .intro:
            return 280.0
        case .bage:
            return 16.0
        case .maxProfile:
            return 120.0
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .smallProfile:
            return 18.0
        case .middleProfile:
            return 20.0
        case .bigProfile:
            return 24.0
        case .intro:
            return 140.0
        case .bage:
            return 8.0
        case .maxProfile:
            return 60.0
        }
    }
}

public enum JProfileImageType: Int {
    case custom
}

@available(iOS 13.0, *)
public struct JProfileImage {
    public let type: JProfileImageType
    public var customImage: UIImage?
    
    public init(type: JProfileImageType, customImage: UIImage?) {
        self.type = type
        self.customImage = customImage
    }
    
    var image: UIImage {
        switch type {
        case .custom:
            guard let customImage = customImage else {
                return UIImage(systemName: "square.and.arrow.up")!
            }
            
            return customImage
        }
    }
}
