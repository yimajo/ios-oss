import Foundation
import Argo
import Curry
import Runes

public struct CommentsEnvelope: Swift.Decodable {
  public let comments: [Comment]
  public let urls: UrlsEnvelope

  public struct UrlsEnvelope: Swift.Decodable {
    public let api: ApiEnvelope

    public struct ApiEnvelope: Swift.Decodable {
      public let moreComments: String
    }
  }
}

extension CommentsEnvelope.UrlsEnvelope.ApiEnvelope {
  enum CodingKeys: String, CodingKey {
    case moreComments = "more_comments"
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.moreComments = try values.decode(String.self, forKey: .moreComments)
  }
}

//import Argo
//import Curry
//import Runes
//
//public struct CommentsEnvelope {
//  public let comments: [Comment]
//  public let urls: UrlsEnvelope
//
//  public struct UrlsEnvelope {
//    public let api: ApiEnvelope
//
//    public struct ApiEnvelope {
//      public let moreComments: String
//    }
//  }
//}
//
extension CommentsEnvelope: Argo.Decodable {
  public static func decode(_ json: JSON) -> Decoded<CommentsEnvelope> {
    return curry(CommentsEnvelope.init)
      <^> json <|| "comments"
      <*> json <| "urls"
  }
}

extension CommentsEnvelope.UrlsEnvelope: Argo.Decodable {
  public static func decode(_ json: JSON) -> Decoded<CommentsEnvelope.UrlsEnvelope> {
    return curry(CommentsEnvelope.UrlsEnvelope.init)
      <^> json <| "api"
  }
}

extension CommentsEnvelope.UrlsEnvelope.ApiEnvelope: Argo.Decodable {
  public static func decode(_ json: JSON) -> Decoded<CommentsEnvelope.UrlsEnvelope.ApiEnvelope> {
    return curry(CommentsEnvelope.UrlsEnvelope.ApiEnvelope.init)
      <^> (json <| "more_comments" <|> .success(""))
  }
}
