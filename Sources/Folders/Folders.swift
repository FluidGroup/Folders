import Foundation

public struct Folder: Hashable {

  public var name: String {
    url.lastPathComponent
  }

  public let url: URL

  public init?(url: URL) {

    var isdirectory: ObjCBool = true
    FileManager.default.fileExists(atPath: url.path, isDirectory: &isdirectory)

    guard isdirectory.boolValue else {
      return nil
    }

    self.url = url
  }

  private init(unsafeURL url: URL) {
    self.url = url
  }

  public func subFolders() -> [Folder] {
    Self.folders(in: url)
  }

  public static func folders(in url: URL) -> [Folder] {

    let manager = FileManager.default

    do {
      let items = try manager.contentsOfDirectory(
        at: url,
        includingPropertiesForKeys: [.isDirectoryKey],
        options: [.skipsHiddenFiles]
      )

      return items.map { Folder(url: $0) }.compactMap { $0 }

    } catch {
      return []
    }

  }
}
