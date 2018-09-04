import Foundation
import Prelude

extension KsApi.Comment {
  internal static let template = Comment.init(
    author: Author.template,
    body: "Exciting!",
    createdAt: Date(timeIntervalSince1970: 1475361315).timeIntervalSince1970,
    deleted: false,
    id: 3,
    parentId: nil,
    replies: nil)
}
