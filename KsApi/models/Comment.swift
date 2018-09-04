import Argo
import Curry
import Runes
import Foundation

public struct Comment: Swift.Decodable {
  public let author: Author
  public let body: String
  public let createdAt: TimeInterval
  public let deleted: Bool
  public let id: Int
  public let parentId: Int?
  public let replies: CommentRepliesConnection?

  public init(author: Author,
              body: String,
              createdAt: TimeInterval,
              deleted: Bool,
              id: Int,
              parentId: Int?,
              replies: CommentRepliesConnection?) {
    self.author = author
    self.body = body
    self.createdAt = createdAt
    self.deleted = deleted
    self.id = id
    self.parentId = parentId
    self.replies = replies
  }

  public struct CommentRepliesConnection: Swift.Decodable {
    public let totalCount: Int
    public let nodes: [Comment]
  }
}

extension Comment {
  private enum CodingKeys: String, CodingKey {
    case author, body, createdAt, deleted, id, parentId, replies
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.author = try values.decode(Author.self, forKey: .author)
    self.body = try values.decode(String.self, forKey: .body)
    self.createdAt = try values.decode(TimeInterval.self, forKey: .createdAt)
    self.deleted = try values.decode(Bool.self, forKey: .deleted)
    self.id = try values.decode(Int.self, forKey: .id)
    self.parentId = try? values.decode(Int.self, forKey: .parentId)
    self.replies = try? values.decode(CommentRepliesConnection.self, forKey: .replies)
  }
}

extension Comment: Equatable {}
public func == (lhs: Comment, rhs: Comment) -> Bool {
  return lhs.id == rhs.id
}

extension Comment: Argo.Decodable {
  public static func decode(_ json: JSON) -> Decoded<Comment> {
    let reply: Decoded<CommentRepliesConnection> = json <| "replies"
    let optionalReply: Decoded<CommentRepliesConnection?> = reply.map(Optional.some) <|> .success(nil)

    let tmp = curry(Comment.init)
      <^> json <| "author"
      <*> json <| "body"
      <*> json <| "created_at"
    return tmp
      <*> json <| "deleted_at"
      <*> json <| "id"
      <*> json <|? "parentId"// >>- decodeToGraphString) as Decoded<String?>) // is this needed?
      <*> optionalReply
  }
}

extension Comment.CommentRepliesConnection: Argo.Decodable {
  public static func decode(_ json: JSON) -> Decoded<Comment.CommentRepliesConnection> {
    return curry(Comment.CommentRepliesConnection.init)
      <^> json <| "totalCount"
      <*> (json <|| "nodes" <|> .success([]))
  }
}

// Decode a time interval so that non-positive values are coalesced to `nil`. We do this because the API
// sends back `0` when the comment hasn't been deleted, and we'd rather handle that value as `nil`.
//private func decodePositiveTimeInterval(_ interval: TimeInterval?) -> Decoded<TimeInterval?> {
//  if let interval = interval, interval > 0.0 {
//    return .success(interval)
//  }
//  return .success(nil)
//}
