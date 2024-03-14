import XCTest

@testable import Folder

final class FolderTests: XCTestCase {
  func testExample() throws {

    let url = URL(
      fileURLWithPath:
        "/Users/muukii/Library/Developer/Xcode/DerivedData/PairsWorkspace-cuqeqxoierznzccgllguwklfrhnx/Build/Intermediates.noindex/Previews/iphonesimulator/FeatureIdentityVerification/Products/Debug-iphonesimulator"
    )
    let manager = FileManager.default

    let f = Folder.folders(in: url)
    print(f)
  }
}
