import Argo
import Curry
import Runes
import Foundation

public struct Author: Swift.Decodable {
  public let avatar: Avatar // image user w/ arguments
  public let id: Int
  public let name: String

  public struct Avatar: Swift.Decodable {
    public let large: String?
    public let medium: String
    public let small: String
  }
}

extension Author {
  private enum CodingKeys: String, CodingKey {
    case avatar, id, name
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.avatar = try values.decode(Avatar.self, forKey: .avatar)
    self.id = try values.decode(Int.self, forKey: .id)
    self.name = try values.decode(String.self, forKey: .name)
  }
}

extension Author: Argo.Decodable {
  public static func decode(_ json: JSON) -> Decoded<Author> {
    return curry(Author.init)
    <^> json <| "avatar"
    <*> json <| "id"
    <*> json <| "name"
  }
}

extension Author.Avatar: Argo.Decodable {
  public static func decode(_ json: JSON) -> Decoded<Author.Avatar> {
    return curry(Author.Avatar.init)
      <^> json <| "large"
      <*> json <| "medium"
      <*> json <| "small"
  }
}

extension Author: Equatable {}
public func == (lhs: Author, rhs: Author) -> Bool {
 return lhs.id == rhs.id
}
