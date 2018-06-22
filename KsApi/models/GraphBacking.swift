public struct GraphBackingEnvelope: Swift.Decodable {
  public fileprivate(set) var backings: [GraphBacking]
}

public struct GraphBacking: Swift.Decodable {

  public let id: Int
  public let project: Project
  public let reward: Reward

  public struct Reward: Swift.Decodable {
    public let name: String
  }

  public struct Project: Swift.Decodable {
    public let name: String

    public struct Location: Swift.Decodable {
      public let latitude: Double
      public let longitude: Double
    }
  }
}
