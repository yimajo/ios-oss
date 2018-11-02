import Prelude

extension User.Stats {
  internal static let template = User.Stats(
    backedProjectsCount: nil,
    createdProjectsCount: nil,
    memberProjectsCount: nil,
    starredProjectsCount: nil,
    unansweredSurveysCount: nil,
    unreadMessagesCount: nil
  )

  internal static let fullTemplate = User.Stats.template
  |> \.backedProjectsCount .~ 5
  |> \.createdProjectsCount .~ 0
  |> \.starredProjectsCount .~ 3
}
