#if DEBUG
import Foundation
import Prelude
import ReactiveSwift
import Result

public struct MockService: ServiceType {
  public let appId: String
  public let serverConfig: ServerConfigType
  public let oauthToken: OauthTokenAuthType?
  public let language: String
  public let currency: String
  public let buildVersion: String

  fileprivate let changeCurrencyError: GraphError?

  fileprivate let changeEmailError: GraphError?
  fileprivate let changeEmailResponse: UserEnvelope<GraphUserEmail>?

  fileprivate let changePasswordError: GraphError?

  fileprivate let changePaymentMethodResult: Result<ChangePaymentMethodEnvelope, ErrorEnvelope>?

  fileprivate let createPledgeResult: Result<CreatePledgeEnvelope, ErrorEnvelope>?

  fileprivate let facebookConnectResponse: User?
  fileprivate let facebookConnectError: ErrorEnvelope?

  fileprivate let fetchActivitiesResponse: [Activity]?
  fileprivate let fetchActivitiesError: ErrorEnvelope?

  fileprivate let fetchBackingResponse: Backing
  fileprivate let backingUpdate: Backing

  fileprivate let fetchGraphCategoriesResponse: RootCategoriesEnvelope?

  fileprivate let fetchCheckoutResponse: CheckoutEnvelope?
  fileprivate let fetchCheckoutError: ErrorEnvelope?

  fileprivate let fetchCommentsResponse: [Comment]?
  fileprivate let fetchCommentsError: ErrorEnvelope?

  fileprivate let fetchConfigResponse: Config?

  fileprivate let fetchDiscoveryResponse: DiscoveryEnvelope?
  fileprivate let fetchDiscoveryError: ErrorEnvelope?

  fileprivate let fetchFriendsResponse: FindFriendsEnvelope?
  fileprivate let fetchFriendsError: ErrorEnvelope?

  fileprivate let fetchFriendStatsResponse: FriendStatsEnvelope?
  fileprivate let fetchFriendStatsError: ErrorEnvelope?

  fileprivate let fetchExportStateResponse: ExportDataEnvelope?
  fileprivate let fetchExportStateError: ErrorEnvelope?

  fileprivate let exportDataError: ErrorEnvelope?

  fileprivate let fetchDraftResponse: UpdateDraft?
  fileprivate let fetchDraftError: ErrorEnvelope?

  fileprivate let fetchGraphCurrencyResponse: UserCurrency?
  fileprivate let fetchGraphUserEmailResponse: GraphUserEmail?

  fileprivate let addAttachmentResponse: UpdateDraft.Image?
  fileprivate let addAttachmentError: ErrorEnvelope?
  fileprivate let removeAttachmentResponse: UpdateDraft.Image?
  fileprivate let removeAttachmentError: ErrorEnvelope?

  fileprivate let publishUpdateError: ErrorEnvelope?

  fileprivate let fetchMessageThreadResult: Result<MessageThread?, ErrorEnvelope>?
  fileprivate let fetchMessageThreadsResponse: [MessageThread]

  fileprivate let fetchProjectResponse: Project?
  fileprivate let fetchProjectError: ErrorEnvelope?

  fileprivate let fetchProjectNotificationsResponse: [ProjectNotification]

  fileprivate let fetchProjectsResponse: [Project]?
  fileprivate let fetchProjectsError: ErrorEnvelope?

  fileprivate let fetchProjectStatsResponse: ProjectStatsEnvelope?
  fileprivate let fetchProjectStatsError: ErrorEnvelope?

  fileprivate let fetchShippingRulesResult: Result<[ShippingRule], ErrorEnvelope>?

  fileprivate let fetchSurveyResponseResponse: SurveyResponse?
  fileprivate let fetchSurveyResponseError: ErrorEnvelope?

  fileprivate let fetchUnansweredSurveyResponsesResponse: [SurveyResponse]

  fileprivate let fetchUpdateCommentsResponse: Result<CommentsEnvelope, ErrorEnvelope>?

  fileprivate let fetchUpdateResponse: Update

  fileprivate let fetchUserProjectsBackedResponse: [Project]?
  fileprivate let fetchUserProjectsBackedError: ErrorEnvelope?

  fileprivate let fetchUserResponse: User?
  fileprivate let fetchUserError: ErrorEnvelope?

  fileprivate let fetchUserSelfResponse: User?
  fileprivate let fetchUserSelfError: ErrorEnvelope?

  fileprivate let followFriendError: ErrorEnvelope?

  fileprivate let incrementVideoCompletionError: ErrorEnvelope?

  fileprivate let incrementVideoStartError: ErrorEnvelope?

  fileprivate let postCommentResponse: Comment?
  fileprivate let postCommentError: ErrorEnvelope?

  fileprivate let fetchProjectActivitiesResponse: [Activity]?
  fileprivate let fetchProjectActivitiesError: ErrorEnvelope?

  fileprivate let loginResponse: AccessTokenEnvelope?
  fileprivate let loginError: ErrorEnvelope?
  fileprivate let resendCodeResponse: ErrorEnvelope?
  fileprivate let resendCodeError: ErrorEnvelope?

  fileprivate let resetPasswordResponse: User?
  fileprivate let resetPasswordError: ErrorEnvelope?

  fileprivate let signupResponse: AccessTokenEnvelope?
  fileprivate let signupError: ErrorEnvelope?

  fileprivate let submitApplePayResponse: SubmitApplePayEnvelope

  fileprivate let toggleStarResponse: StarEnvelope?
  fileprivate let toggleStarError: ErrorEnvelope?

  fileprivate let unfollowFriendError: ErrorEnvelope?

  fileprivate let updateDraftError: ErrorEnvelope?

  fileprivate let updatePledgeResult: Result<UpdatePledgeEnvelope, ErrorEnvelope>?

  fileprivate let updateProjectNotificationResponse: ProjectNotification?
  fileprivate let updateProjectNotificationError: ErrorEnvelope?

  fileprivate let updateUserSelfError: ErrorEnvelope?

  public init(appId: String = "com.kickstarter.kickstarter.mock",
                serverConfig: ServerConfigType,
                oauthToken: OauthTokenAuthType?,
                language: String,
                currency: String,
                buildVersion: String = "1") {

    self.init(
      appId: appId,
      serverConfig: serverConfig,
      oauthToken: oauthToken,
      language: language,
      currency: currency,
      buildVersion: buildVersion,
      fetchActivitiesResponse: nil
    )
  }

  public init(appId: String = "com.kickstarter.kickstarter.mock",
              serverConfig: ServerConfigType = ServerConfig.production,
              oauthToken: OauthTokenAuthType? = nil,
              language: String = "en",
              currency: String = "USD",
              buildVersion: String = "1",
              changeEmailError: GraphError? = nil,
              changeEmailResponse: UserEnvelope<GraphUserEmail>? = nil,
              changePasswordError: GraphError? = nil,
              changeCurrencyError: GraphError? = nil,
              changePaymentMethodResult: Result<ChangePaymentMethodEnvelope, ErrorEnvelope>? = nil,
              createPledgeResult: Result<CreatePledgeEnvelope, ErrorEnvelope>? = nil,
              facebookConnectResponse: User? = nil,
              facebookConnectError: ErrorEnvelope? = nil,
              fetchActivitiesResponse: [Activity]? = nil,
              fetchActivitiesError: ErrorEnvelope? = nil,
              fetchBackingResponse: Backing? = nil,
              backingUpdate: Backing? = nil,
              fetchGraphCategoriesResponse: RootCategoriesEnvelope? = nil,
              fetchCheckoutResponse: CheckoutEnvelope? = nil,
              fetchCheckoutError: ErrorEnvelope? = nil,
              fetchCommentsResponse: [Comment]? = nil,
              fetchCommentsError: ErrorEnvelope? = nil,
              fetchConfigResponse: Config? = nil,
              fetchDiscoveryResponse: DiscoveryEnvelope? = nil,
              fetchDiscoveryError: ErrorEnvelope? = nil,
              fetchFriendsResponse: FindFriendsEnvelope? = nil,
              fetchFriendsError: ErrorEnvelope? = nil,
              fetchFriendStatsResponse: FriendStatsEnvelope? = nil,
              fetchFriendStatsError: ErrorEnvelope? = nil,
              fetchExportStateResponse: ExportDataEnvelope? = nil,
              fetchExportStateError: ErrorEnvelope? = nil,
              exportDataError: ErrorEnvelope? = nil,
              fetchDraftResponse: UpdateDraft? = nil,
              fetchDraftError: ErrorEnvelope? = nil,
              fetchGraphUserEmailResponse: GraphUserEmail? = nil,
              fetchGraphCurrencyResponse: UserCurrency? = nil,
              addAttachmentResponse: UpdateDraft.Image? = nil,
              addAttachmentError: ErrorEnvelope? = nil,
              removeAttachmentResponse: UpdateDraft.Image? = nil,
              removeAttachmentError: ErrorEnvelope? = nil,
              publishUpdateError: ErrorEnvelope? = nil,
              fetchMessageThreadResult: Result<MessageThread?, ErrorEnvelope>? = nil,
              fetchMessageThreadsResponse: [MessageThread]? = nil,
              fetchProjectActivitiesResponse: [Activity]? = nil,
              fetchProjectActivitiesError: ErrorEnvelope? = nil,
              fetchProjectResponse: Project? = nil,
              fetchProjectError: ErrorEnvelope? = nil,
              fetchProjectNotificationsResponse: [ProjectNotification]? = nil,
              fetchProjectsResponse: [Project]? = nil,
              fetchProjectsError: ErrorEnvelope? = nil,
              fetchProjectStatsResponse: ProjectStatsEnvelope? = nil,
              fetchProjectStatsError: ErrorEnvelope? = nil,
              fetchShippingRulesResult: Result<[ShippingRule], ErrorEnvelope>? = nil,
              fetchUserProjectsBackedResponse: [Project]? = nil,
              fetchUserProjectsBackedError: ErrorEnvelope? = nil,
              fetchUserResponse: User? = nil,
              fetchUserError: ErrorEnvelope? = nil,
              fetchUserSelfResponse: User? = nil,
              followFriendError: ErrorEnvelope? = nil,
              incrementVideoCompletionError: ErrorEnvelope? = nil,
              incrementVideoStartError: ErrorEnvelope? = nil,
              fetchSurveyResponseResponse: SurveyResponse? = nil,
              fetchSurveyResponseError: ErrorEnvelope? = nil,
              fetchUnansweredSurveyResponsesResponse: [SurveyResponse] = [],
              fetchUpdateCommentsResponse: Result<CommentsEnvelope, ErrorEnvelope>? = nil,
              fetchUpdateResponse: Update? = nil,
              fetchUserSelfError: ErrorEnvelope? = nil,
              postCommentResponse: Comment? = nil,
              postCommentError: ErrorEnvelope? = nil,
              loginResponse: AccessTokenEnvelope? = nil,
              loginError: ErrorEnvelope? = nil,
              resendCodeResponse: ErrorEnvelope? = nil,
              resendCodeError: ErrorEnvelope? = nil,
              resetPasswordResponse: User? = nil,
              resetPasswordError: ErrorEnvelope? = nil,
              signupResponse: AccessTokenEnvelope? = nil,
              signupError: ErrorEnvelope? = nil,
              submitApplePayResponse: SubmitApplePayEnvelope? = nil,
              toggleStarResponse: StarEnvelope? = nil,
              toggleStarError: ErrorEnvelope? = nil,
              unfollowFriendError: ErrorEnvelope? = nil,
              updateDraftError: ErrorEnvelope? = nil,
              updatePledgeResult: Result<UpdatePledgeEnvelope, ErrorEnvelope>? = nil,
              updateProjectNotificationResponse: ProjectNotification? = nil,
              updateProjectNotificationError: ErrorEnvelope? = nil,
              updateUserSelfError: ErrorEnvelope? = nil) {

    self.appId = appId
    self.serverConfig = serverConfig
    self.oauthToken = oauthToken
    self.language = language
    self.currency = currency
    self.buildVersion = buildVersion

    self.changeCurrencyError = changeCurrencyError

    self.changeEmailResponse = changeEmailResponse
    self.changeEmailError = changeEmailError

    self.changePasswordError = changePasswordError

    self.changePaymentMethodResult = changePaymentMethodResult
    self.createPledgeResult = createPledgeResult

    self.facebookConnectResponse = facebookConnectResponse
    self.facebookConnectError = facebookConnectError

    self.fetchActivitiesResponse = fetchActivitiesResponse ?? [
      .template,
      .template |> Activity.lens.category .~ .backing,
      .template |> Activity.lens.category .~ .success
    ]

    self.fetchActivitiesError = fetchActivitiesError

    self.fetchBackingResponse = fetchBackingResponse ?? .template
    self.backingUpdate = backingUpdate ?? .template

    self.fetchGraphCategoriesResponse = fetchGraphCategoriesResponse ?? (.template
      |> RootCategoriesEnvelope.lens.categories .~ [
        .art,
        .filmAndVideo,
        .illustration,
        .documentary
      ]
    )

    self.fetchGraphCurrencyResponse = fetchGraphCurrencyResponse

    self.fetchGraphUserEmailResponse = fetchGraphUserEmailResponse

    self.fetchCheckoutResponse = fetchCheckoutResponse
    self.fetchCheckoutError = fetchCheckoutError

    self.fetchCommentsResponse = fetchCommentsResponse ?? [
      .template |> Comment.lens.id .~ 2,
      .template |> Comment.lens.id .~ 1
    ]

    self.fetchCommentsError = fetchCommentsError

    self.fetchConfigResponse = fetchConfigResponse ?? .template

    self.fetchDiscoveryResponse = fetchDiscoveryResponse
    self.fetchDiscoveryError = fetchDiscoveryError

    self.fetchFriendsResponse = fetchFriendsResponse
    self.fetchFriendsError = fetchFriendsError

    self.fetchFriendStatsResponse = fetchFriendStatsResponse
    self.fetchFriendStatsError = fetchFriendStatsError

    self.fetchExportStateResponse = fetchExportStateResponse
    self.fetchExportStateError = fetchExportStateError

    self.exportDataError = exportDataError

    self.fetchDraftResponse = fetchDraftResponse
    self.fetchDraftError = fetchDraftError

    self.addAttachmentResponse = addAttachmentResponse
    self.addAttachmentError = addAttachmentError
    self.removeAttachmentResponse = removeAttachmentResponse
    self.removeAttachmentError = removeAttachmentError

    self.publishUpdateError = publishUpdateError

    self.fetchMessageThreadResult = fetchMessageThreadResult

    self.fetchMessageThreadsResponse = fetchMessageThreadsResponse ?? [
      .template |> MessageThread.lens.id .~ 1,
      .template |> MessageThread.lens.id .~ 2,
      .template |> MessageThread.lens.id .~ 3
    ]

    self.fetchProjectActivitiesResponse = fetchProjectActivitiesResponse ?? [
      .template,
      .template |> Activity.lens.category .~ .backing,
      .template |> Activity.lens.category .~ .commentProject
      ]
      .enumerated()
      .map(Activity.lens.id.set)

    self.fetchProjectActivitiesError = fetchProjectActivitiesError

    self.fetchProjectResponse = fetchProjectResponse
    self.fetchProjectError = fetchProjectError

    self.fetchProjectNotificationsResponse = fetchProjectNotificationsResponse ?? [
      .template |> ProjectNotification.lens.id .~ 1,
      .template |> ProjectNotification.lens.id .~ 2,
      .template |> ProjectNotification.lens.id .~ 3
    ]

    self.fetchProjectsResponse = fetchProjectsResponse ?? []

    self.fetchProjectsError = fetchProjectsError

    self.fetchProjectStatsResponse = fetchProjectStatsResponse
    self.fetchProjectStatsError = fetchProjectStatsError

    self.fetchShippingRulesResult = fetchShippingRulesResult

    self.fetchSurveyResponseResponse = fetchSurveyResponseResponse
    self.fetchSurveyResponseError = fetchSurveyResponseError

    self.fetchUnansweredSurveyResponsesResponse = fetchUnansweredSurveyResponsesResponse

    self.fetchUpdateCommentsResponse = fetchUpdateCommentsResponse

    self.fetchUpdateResponse = fetchUpdateResponse ?? .template

    self.fetchUserProjectsBackedResponse = fetchUserProjectsBackedResponse
    self.fetchUserProjectsBackedError = fetchUserProjectsBackedError

    self.fetchUserResponse = fetchUserResponse
    self.fetchUserError = fetchUserError

    self.fetchUserSelfResponse = fetchUserSelfResponse ?? .template
    self.fetchUserSelfError = fetchUserSelfError

    self.followFriendError = followFriendError

    self.incrementVideoCompletionError = incrementVideoCompletionError

    self.incrementVideoStartError = incrementVideoStartError

    self.postCommentResponse = postCommentResponse ?? .template

    self.postCommentError = postCommentError

    self.loginResponse = loginResponse

    self.loginError = loginError

    self.resendCodeResponse = resendCodeResponse

    self.resendCodeError = resendCodeError

    self.resetPasswordResponse = resetPasswordResponse

    self.resetPasswordError = resetPasswordError

    self.signupResponse = signupResponse

    self.signupError = signupError

    self.submitApplePayResponse = submitApplePayResponse ?? .template

    self.toggleStarResponse = toggleStarResponse
    self.toggleStarError = toggleStarError

    self.unfollowFriendError = unfollowFriendError

    self.updateDraftError = updateDraftError

    self.updatePledgeResult = updatePledgeResult

    self.updateProjectNotificationResponse = updateProjectNotificationResponse

    self.updateProjectNotificationError = updateProjectNotificationError

    self.updateUserSelfError = updateUserSelfError
  }

  public func changeEmail(input: ChangeEmailInput) ->
    SignalProducer<GraphMutationEmptyResponseEnvelope, GraphError> {

      if let error = self.changeEmailError {
        return SignalProducer(error: error)
      }

      return SignalProducer(value: GraphMutationEmptyResponseEnvelope())
  }

  public func createPledge(project: Project,
                           amount: Double,
                           reward: Reward?,
                           shippingLocation: Location?,
                           tappedReward: Bool) -> SignalProducer<CreatePledgeEnvelope, ErrorEnvelope> {

    if let error = self.createPledgeResult?.error {
      return SignalProducer(error: error)
    }

    return SignalProducer(value: self.createPledgeResult?.value ?? .template)
  }

  public func facebookConnect(facebookAccessToken token: String)
    -> SignalProducer<User, ErrorEnvelope> {

      if let response = facebookConnectResponse {
        return SignalProducer(value: response)
      } else if let error = facebookConnectError {
        return SignalProducer(error: error)
      }

      return SignalProducer(value:
        User.template
          |> \.id .~ 1
          |> \.facebookConnected .~ true
      )
  }

  public func changePassword(input: ChangePasswordInput) ->
    SignalProducer<GraphMutationEmptyResponseEnvelope, GraphError> {
      if let error = self.changePasswordError {
        return SignalProducer(error: error)
      } else {
        return SignalProducer(value: GraphMutationEmptyResponseEnvelope())
      }
  }

  public func changeCurrency(input: ChangeCurrencyInput) ->
   SignalProducer<GraphMutationEmptyResponseEnvelope, GraphError> {
      if let error = self.changeCurrencyError {
        return SignalProducer(error: error)
      } else {
        return SignalProducer(value: GraphMutationEmptyResponseEnvelope())
      }
  }

  public func fetchCheckout(checkoutUrl url: String) -> SignalProducer<CheckoutEnvelope, ErrorEnvelope> {
    if let response = fetchCheckoutResponse {
      return SignalProducer(value: response)
    } else if let error = fetchCheckoutError {
      return SignalProducer(error: error)
    }

    return SignalProducer(value: .template)
  }

  public func fetchComments(project: Project) -> SignalProducer<CommentsEnvelope, ErrorEnvelope> {

    if let error = fetchCommentsError {
      return SignalProducer(error: error)
    } else if let comments = fetchCommentsResponse {
      return SignalProducer(
        value: CommentsEnvelope(
          comments: comments,
          urls: CommentsEnvelope.UrlsEnvelope(
            api: CommentsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreComments: ""
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchComments(paginationUrl url: String) -> SignalProducer<CommentsEnvelope, ErrorEnvelope> {
    if let error = fetchCommentsError {
      return SignalProducer(error: error)
    } else if let comments = fetchCommentsResponse {
      return SignalProducer(
        value: CommentsEnvelope(
          comments: comments,
          urls: CommentsEnvelope.UrlsEnvelope(
            api: CommentsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreComments: ""
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchComments(update: Update) -> SignalProducer<CommentsEnvelope, ErrorEnvelope> {

    if let error = fetchUpdateCommentsResponse?.error {
      return SignalProducer(error: error)
    } else if let comments = fetchUpdateCommentsResponse {
      return SignalProducer(value: comments.value ?? .template)
    }
    return .empty
  }

  public func fetchConfig() -> SignalProducer<Config, ErrorEnvelope> {
    guard let config = self.fetchConfigResponse else { return .empty }
    return SignalProducer(value: config)
  }

  public func fetchFriends() -> SignalProducer<FindFriendsEnvelope, ErrorEnvelope> {
    if let response = fetchFriendsResponse {
      return SignalProducer(value: response)
    } else if let error = fetchFriendsError {
      return SignalProducer(error: error)
    }

    return SignalProducer(value: .template)
  }

  public func fetchFriends(paginationUrl: String)
    -> SignalProducer<FindFriendsEnvelope, ErrorEnvelope> {
    return self.fetchFriends()
  }

  public func fetchFriendStats() -> SignalProducer<FriendStatsEnvelope, ErrorEnvelope> {
    if let response = fetchFriendStatsResponse {
      return SignalProducer(value: response)
    } else if let error = fetchFriendStatsError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: .template)
  }

  public func followAllFriends() -> SignalProducer<VoidEnvelope, ErrorEnvelope> {
    return SignalProducer(value: VoidEnvelope())
  }

  public func exportData() -> SignalProducer<VoidEnvelope, ErrorEnvelope> {
    if let error = exportDataError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: VoidEnvelope())
  }

  public func followFriend(userId id: Int) -> SignalProducer<User, ErrorEnvelope> {
    if let error = followFriendError {
      return SignalProducer(error: error)
    }

    return SignalProducer(value:
      User.template
        |> \.id .~ id
        |> \.isFriend .~ true
    )
  }

  public func fetchGraphCategories(query: NonEmptySet<Query>)
    -> SignalProducer<RootCategoriesEnvelope, GraphError> {
    if let response = self.fetchGraphCategoriesResponse {
      return SignalProducer(value: response)
    }
    return .empty
  }

  public func fetchGraphCategory(query: NonEmptySet<Query>)
    -> SignalProducer<CategoryEnvelope, GraphError> {
      return SignalProducer(value: CategoryEnvelope(node: .template |> Category.lens.id .~ "\(query.head)"))
  }

  public func fetchGraphUserEmail(query: NonEmptySet<Query>)
    -> SignalProducer<UserEnvelope<GraphUserEmail>, GraphError> {
      return SignalProducer(value: changeEmailResponse ?? UserEnvelope<GraphUserEmail>(me: .template))
  }

  public func fetchGraphCurrency(query: NonEmptySet<Query>)
    -> SignalProducer<UserEnvelope<UserCurrency>, GraphError> {
      return SignalProducer(value: UserEnvelope<UserCurrency>(me: UserCurrency.template))
  }

  public func fetchGraph<A>(query: NonEmptySet<Query>) -> SignalProducer<A, GraphError> where A: Decodable {
    return .empty
  }

  public func unfollowFriend(userId id: Int) -> SignalProducer<VoidEnvelope, ErrorEnvelope> {
    if let error = unfollowFriendError {
      return SignalProducer(error: error)
    }

    return SignalProducer(value: VoidEnvelope())
  }

  public func login(_ oauthToken: OauthTokenAuthType) -> MockService {
    return self |> MockService.lens.oauthToken .~ oauthToken
  }

  public func logout() -> MockService {
    return self |> MockService.lens.oauthToken .~ nil
  }

  public func fetchActivities(count: Int?) -> SignalProducer<ActivityEnvelope, ErrorEnvelope> {

    if let error = fetchActivitiesError {
      return SignalProducer(error: error)
    } else if let activities = fetchActivitiesResponse {
      return SignalProducer(
        value: ActivityEnvelope(
          activities: activities,
          urls: ActivityEnvelope.UrlsEnvelope(
            api: ActivityEnvelope.UrlsEnvelope.ApiEnvelope(
              moreActivities: "http://\(Secrets.Api.Endpoint.production)/gimme/more"
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchActivities(paginationUrl: String)
    -> SignalProducer<ActivityEnvelope, ErrorEnvelope> {
      return self.fetchActivities(count: nil)
  }

  public func fetchBacking(forProject project: Project, forUser user: User)
    -> SignalProducer<Backing, ErrorEnvelope> {

    return SignalProducer(
      value: fetchBackingResponse
        |> Backing.lens.backer .~ user
        |> Backing.lens.backerId .~ user.id
        |> Backing.lens.projectId .~ project.id
    )
  }

  public func backingUpdate(forProject project: Project, forUser user: User, received: Bool)
    -> SignalProducer<Backing, ErrorEnvelope> {

      return SignalProducer(
        value: fetchBackingResponse
          |> Backing.lens.backer .~ user
          |> Backing.lens.backerId .~ user.id
          |> Backing.lens.projectId .~ project.id
          |> Backing.lens.backerCompleted .~ received
      )
  }

  public func fetchDiscovery(paginationUrl: String)
    -> SignalProducer<DiscoveryEnvelope, ErrorEnvelope> {

      if let error = fetchDiscoveryError {
        return SignalProducer(error: error)
      }

      let project: (Int) -> Project = {
        .template |> Project.lens.id .~ ($0 + paginationUrl.hashValue)
      }
      let envelope = self.fetchDiscoveryResponse ?? (.template
        |> DiscoveryEnvelope.lens.projects .~ (1...4).map(project)
        |> DiscoveryEnvelope.lens.urls.api.moreProjects .~ (paginationUrl + "+1")
      )

      return SignalProducer(value: envelope)
  }

  public func fetchDiscovery(params: DiscoveryParams)
    -> SignalProducer<DiscoveryEnvelope, ErrorEnvelope> {

      if let error = fetchDiscoveryError {
        return SignalProducer(error: error)
      }

      let project: (Int) -> Project = {
        .template |> Project.lens.id %~ const($0 + params.hashValue)
      }
      let envelope = self.fetchDiscoveryResponse ?? (.template
        |> DiscoveryEnvelope.lens.projects .~ (1...4).map(project)
      )

      return SignalProducer(value: envelope)
  }

  public func fetchMessageThread(messageThreadId: Int)
    -> SignalProducer<MessageThreadEnvelope, ErrorEnvelope> {
      if let error = self.fetchMessageThreadResult?.error {
        return SignalProducer(error: error)
      }

      return SignalProducer(
        value: MessageThreadEnvelope(
          participants: [.template, .template |> \.id .~ 2],
          messages: [
            .template |> Message.lens.id .~ 1,
            .template |> Message.lens.id .~ 2,
            .template |> Message.lens.id .~ 3
          ],
          messageThread: self.fetchMessageThreadResult?.value as? MessageThread ?? .template
        )
      )
  }

  public func fetchMessageThread(backing: Backing)
    -> SignalProducer<MessageThreadEnvelope?, ErrorEnvelope> {
      if let error = self.fetchMessageThreadResult?.error {
        return SignalProducer(error: error)
      }

      if let thread = self.fetchMessageThreadResult?.value as? MessageThread {
        return SignalProducer(
          value: MessageThreadEnvelope(
            participants: [.template, .template |> \.id .~ 2],
            messages: [
              .template |> Message.lens.id .~ 1,
              .template |> Message.lens.id .~ 2,
              .template |> Message.lens.id .~ 3
            ],
            messageThread: thread
          )
        )
      } else {
        return SignalProducer(value: nil)
      }
  }

  public func fetchMessageThreads(mailbox: Mailbox, project: Project?)
    -> SignalProducer<MessageThreadsEnvelope, ErrorEnvelope> {

      return SignalProducer(value:
        MessageThreadsEnvelope(
          messageThreads: self.fetchMessageThreadsResponse,
          urls: MessageThreadsEnvelope.UrlsEnvelope(
            api: MessageThreadsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreMessageThreads: ""
            )
          )
        )
      )
  }

  public func fetchMessageThreads(paginationUrl: String)
    -> SignalProducer<MessageThreadsEnvelope, ErrorEnvelope> {

      return SignalProducer(value:
        MessageThreadsEnvelope(
          messageThreads: self.fetchMessageThreadsResponse,
          urls: MessageThreadsEnvelope.UrlsEnvelope(
            api: MessageThreadsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreMessageThreads: ""
            )
          )
        )
      )
  }

  public func fetchProjectNotifications() -> SignalProducer<[ProjectNotification], ErrorEnvelope> {
    return SignalProducer(value: self.fetchProjectNotificationsResponse)
  }

  public func fetchProject(param: Param) -> SignalProducer<Project, ErrorEnvelope> {
    if let error = self.fetchProjectError {
      return SignalProducer(error: error)
    }
    if let project = self.fetchProjectResponse {
      return SignalProducer(value: project)
    }
    return SignalProducer(
      value: .template
        |> Project.lens.id %~ { param.id ?? $0 }
        |> Project.lens.slug %~ { param.slug ?? $0 }
    )
  }

  public func fetchProject(_ params: DiscoveryParams) -> SignalProducer<DiscoveryEnvelope, ErrorEnvelope> {
    if let envelope = self.fetchDiscoveryResponse {
      return SignalProducer(value: envelope)
    }
    let envelope = .template
      |> DiscoveryEnvelope.lens.projects .~ [
        .template |> Project.lens.id .~ params.hashValue
    ]
    return SignalProducer(value: envelope)
  }

  public func fetchProject(project: Project) -> SignalProducer<Project, ErrorEnvelope> {
    if let project = self.fetchProjectResponse {
      return SignalProducer(value: project)
    }
    return SignalProducer(value: project)
  }

  public func fetchProjectActivities(forProject project: Project) ->
    SignalProducer<ProjectActivityEnvelope, ErrorEnvelope> {

    if let error = fetchProjectActivitiesError {
      return SignalProducer(error: error)
    } else if let activities = fetchProjectActivitiesResponse {
      return SignalProducer(
        value: ProjectActivityEnvelope(
          activities: activities,
          urls: ProjectActivityEnvelope.UrlsEnvelope(
            api: ProjectActivityEnvelope.UrlsEnvelope.ApiEnvelope(
              moreActivities: "http://\(Secrets.Api.Endpoint.production)/gimme/more"
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchProjectActivities(paginationUrl: String)
    -> SignalProducer<ProjectActivityEnvelope, ErrorEnvelope> {

    if let error = fetchProjectActivitiesError {
      return SignalProducer(error: error)
    } else if let activities = fetchProjectActivitiesResponse {
      return SignalProducer(
        value: ProjectActivityEnvelope(
          activities: activities,
          urls: ProjectActivityEnvelope.UrlsEnvelope(
            api: ProjectActivityEnvelope.UrlsEnvelope.ApiEnvelope(
              moreActivities: ""
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchProjects(member: Bool) -> SignalProducer<ProjectsEnvelope, ErrorEnvelope> {

    if let error = fetchProjectsError {
      return SignalProducer(error: error)
    } else if let projects = fetchProjectsResponse {
      return SignalProducer(
        value: ProjectsEnvelope(
          projects: projects,
          urls: ProjectsEnvelope.UrlsEnvelope(
            api: ProjectsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreProjects: ""
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchProjects(paginationUrl: String) ->
    SignalProducer<ProjectsEnvelope, ErrorEnvelope> {
      return fetchProjects(member: true)
  }

  public func fetchProjectStats(projectId: Int) ->
    SignalProducer<ProjectStatsEnvelope, ErrorEnvelope> {
      if let error = fetchProjectStatsError {
        return SignalProducer(error: error)
      } else if let response = fetchProjectStatsResponse {
        return SignalProducer(value: response)
      }

      return SignalProducer(value: .template)
  }

  public func fetchRewardShippingRules(projectId: Int, rewardId: Int)
    -> SignalProducer<ShippingRulesEnvelope, ErrorEnvelope> {

      if let error = self.fetchShippingRulesResult?.error {
        return SignalProducer(error: error)
      }

      return SignalProducer(value: .init(shippingRules: self.fetchShippingRulesResult?.value ?? [.template]))
  }

  public func fetchUserProjectsBacked() -> SignalProducer<ProjectsEnvelope, ErrorEnvelope> {
    if let error = fetchUserProjectsBackedError {
      return SignalProducer(error: error)
    } else if let projects = fetchUserProjectsBackedResponse {
      return SignalProducer(
        value: ProjectsEnvelope(
          projects: projects,
          urls: ProjectsEnvelope.UrlsEnvelope(
            api: ProjectsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreProjects: ""
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchUserProjectsBacked(paginationUrl url: String)
    -> SignalProducer<ProjectsEnvelope, ErrorEnvelope> {

    if let error = fetchUserProjectsBackedError {
      return SignalProducer(error: error)
    } else if let projects = fetchUserProjectsBackedResponse {
      return SignalProducer(
        value: ProjectsEnvelope(
          projects: projects,
          urls: ProjectsEnvelope.UrlsEnvelope(
            api: ProjectsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreProjects: ""
            )
          )
        )
      )
    }
    return .empty
  }

  public func fetchUserSelf() -> SignalProducer<User, ErrorEnvelope> {
    if let error = fetchUserSelfError {
      return SignalProducer(error: error)
    }

    return SignalProducer(value: self.fetchUserSelfResponse ?? .template)
  }

  public func fetchSurveyResponse(surveyResponseId id: Int)
    -> SignalProducer<SurveyResponse, ErrorEnvelope> {
    if let response = fetchSurveyResponseResponse {
      return SignalProducer(value: response)
    } else if let error = fetchSurveyResponseError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: .template |> SurveyResponse.lens.id .~ id)
  }

  public func fetchUnansweredSurveyResponses() -> SignalProducer<[SurveyResponse], ErrorEnvelope> {
    return SignalProducer(value: self.fetchUnansweredSurveyResponsesResponse)
  }

  public func fetchUser(userId: Int) -> SignalProducer<User, ErrorEnvelope> {
    if let error = self.fetchUserError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: self.fetchUserResponse ?? (.template |> \.id .~ userId))
  }

  public func fetchUser(_ user: User) -> SignalProducer<User, ErrorEnvelope> {
    if let error = self.fetchUserError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: fetchUserResponse ?? user)
  }

  public func fetchCategory(param: Param)
    -> SignalProducer<KsApi.Category, GraphError> {
    switch param {
    case let .id(id):
      return SignalProducer(value: .template |> Category.lens.id .~ "\(id)")
    default:
      return .empty
      }
  }

  public func incrementVideoCompletion(forProject project: Project) ->
    SignalProducer<VoidEnvelope, ErrorEnvelope> {
      if let error = incrementVideoCompletionError {
        return .init(error: error)
      } else {
        return .init(value: VoidEnvelope())
      }
  }

  public func incrementVideoStart(forProject project: Project) ->
    SignalProducer<VoidEnvelope, ErrorEnvelope> {
      if let error = incrementVideoStartError {
        return .init(error: error)
      } else {
        return .init(value: VoidEnvelope())
      }
  }

  public func toggleStar(_ project: Project) -> SignalProducer<StarEnvelope, ErrorEnvelope> {
   if let error = self.toggleStarError {
        return SignalProducer(error: error)
      } else if let toggleStar = self.toggleStarResponse {
        return SignalProducer(value: toggleStar)
      }

      return SignalProducer(value: .template)
  }

  public func star(_ project: Project) -> SignalProducer<StarEnvelope, ErrorEnvelope> {
    let project = project |> Project.lens.personalization.isStarred .~ true
    return .init(value: .template |> StarEnvelope.lens.project .~ project)
  }

  public func login(email: String, password: String, code: String?) ->
    SignalProducer<AccessTokenEnvelope, ErrorEnvelope> {

    if let error = loginError {
      return SignalProducer(error: error)
    } else if let accessTokenEnvelope = loginResponse {
      return SignalProducer(value: accessTokenEnvelope)
    } else if let resendCodeResponse = resendCodeResponse {
      return SignalProducer(error: resendCodeResponse)
    } else if let resendCodeError = resendCodeError {
      return SignalProducer(error: resendCodeError)
    }

    return SignalProducer(value: AccessTokenEnvelope(accessToken: "deadbeef", user: .template))
  }

  public func login(facebookAccessToken: String, code: String?) ->
    SignalProducer<AccessTokenEnvelope, ErrorEnvelope> {

    if let error = loginError {
      return SignalProducer(error: error)
    } else if let accessTokenEnvelope = loginResponse {
      return SignalProducer(value: accessTokenEnvelope)
    } else if let resendCodeResponse = resendCodeResponse {
      return SignalProducer(error: resendCodeResponse)
    } else if let resendCodeError = resendCodeError {
      return SignalProducer(error: resendCodeError)
    }

    return SignalProducer(value: AccessTokenEnvelope(accessToken: "deadbeef", user: .template))
  }

  public func markAsRead(messageThread: MessageThread)
    -> SignalProducer<MessageThread, ErrorEnvelope> {
      return SignalProducer(value: messageThread)
  }

  public func postComment(_ body: String, toProject project: Project) ->
    SignalProducer<Comment, ErrorEnvelope> {

    if let error = self.postCommentError {
      return SignalProducer(error: error)
    } else if let comment = self.postCommentResponse {
      return SignalProducer(value: comment)
    }
    return .empty
  }

  public func postComment(_ body: String, toUpdate update: Update) -> SignalProducer<Comment, ErrorEnvelope> {

    if let error = self.postCommentError {
      return SignalProducer(error: error)
    } else if let comment = self.postCommentResponse {
      return SignalProducer(value: comment)
    }
    return .empty
  }

  public func resetPassword(email: String) -> SignalProducer<User, ErrorEnvelope> {
    if let response = resetPasswordResponse {
      return SignalProducer(value: response)
    } else if let error = resetPasswordError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: .template)
  }

  public func register(pushToken: String) -> SignalProducer<VoidEnvelope, ErrorEnvelope> {
    return SignalProducer(value: VoidEnvelope())
  }

  public func exportDataState() -> SignalProducer<ExportDataEnvelope, ErrorEnvelope> {
    if let response = fetchExportStateResponse {
      return SignalProducer(value: response)
    } else if let error = fetchExportStateError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: .template)
  }

  public func searchMessages(query: String, project: Project?)
    -> SignalProducer<MessageThreadsEnvelope, ErrorEnvelope> {
      return SignalProducer(value:
        MessageThreadsEnvelope(
          messageThreads: self.fetchMessageThreadsResponse,
          urls: MessageThreadsEnvelope.UrlsEnvelope(
            api: MessageThreadsEnvelope.UrlsEnvelope.ApiEnvelope(
              moreMessageThreads: ""
            )
          )
        )
      )
  }

  public func sendMessage(body: String, toSubject subject: MessageSubject)
    -> SignalProducer<Message, ErrorEnvelope> {

      return SignalProducer(
        value: .template
          |> Message.lens.id .~ body.hashValue
          |> Message.lens.body .~ body
      )
  }

  public func signup(name: String,
                       email: String,
                       password: String,
                       passwordConfirmation: String,
                       sendNewsletters: Bool) -> SignalProducer<AccessTokenEnvelope, ErrorEnvelope> {
    if let error = signupError {
      return SignalProducer(error: error)
    } else if let accessTokenEnvelope = signupResponse {
      return SignalProducer(value: accessTokenEnvelope)
    }
    return SignalProducer(value:
      AccessTokenEnvelope(
        accessToken: "deadbeef",
        user: .template
          |> \.name .~ name
          |> \.newsletters.weekly .~ sendNewsletters
      )
    )
  }

  public func signup(facebookAccessToken: String, sendNewsletters: Bool) ->
    SignalProducer<AccessTokenEnvelope, ErrorEnvelope> {

    if let error = signupError {
      return SignalProducer(error: error)
    } else if let accessTokenEnvelope = signupResponse {
      return SignalProducer(value: accessTokenEnvelope)
    }
    return SignalProducer(value:
      AccessTokenEnvelope(
        accessToken: "deadbeef",
        user: .template
      )
    )
  }

  public func submitApplePay(checkoutUrl: String,
                             stripeToken: String,
                             paymentInstrumentName: String,
                             paymentNetwork: String,
                             transactionIdentifier: String) ->
    SignalProducer<SubmitApplePayEnvelope, ErrorEnvelope> {

    return SignalProducer(value: self.submitApplePayResponse)
  }

  public func updateProjectNotification(_ notification: ProjectNotification)
    -> SignalProducer<ProjectNotification, ErrorEnvelope> {
      if let error = updateProjectNotificationError {
        return SignalProducer(error: error)
      }
      return SignalProducer(value: notification)
  }

  public func updateUserSelf(_ user: User) -> SignalProducer<User, ErrorEnvelope> {
    if let error = updateUserSelfError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: user)
  }

  public func fetchUpdate(updateId: Int, projectParam: Param)
    -> SignalProducer<Update, ErrorEnvelope> {

      return SignalProducer(value: self.fetchUpdateResponse |> Update.lens.id .~ updateId)
  }

  public func fetchUpdateDraft(forProject project: Project) -> SignalProducer<UpdateDraft, ErrorEnvelope> {
    if let error = self.fetchDraftError {
      return SignalProducer(error: error)
    }
    return SignalProducer(value: fetchDraftResponse ?? .template)
  }

  public func update(draft: UpdateDraft, title: String, body: String, isPublic: Bool)
    -> SignalProducer<UpdateDraft, ErrorEnvelope> {

      if let error = self.updateDraftError {
        return SignalProducer(error: error)
      }
      let updatedDraft = draft
        |> UpdateDraft.lens.update.title .~ title
        |> UpdateDraft.lens.update.body .~ body
        |> UpdateDraft.lens.update.isPublic .~ isPublic

      return SignalProducer(value: updatedDraft)
  }

  public func updatePledge(
    project: Project,
    amount: Double,
    reward: Reward?,
    shippingLocation: Location?,
    tappedReward: Bool) -> SignalProducer<UpdatePledgeEnvelope, ErrorEnvelope> {

    if let error = self.updatePledgeResult?.error {
      return SignalProducer(error: error)
    }

    return SignalProducer(value: self.updatePledgeResult?.value ?? .template)
  }

  public func addImage(file fileURL: URL, toDraft draft: UpdateDraft)
    -> SignalProducer<UpdateDraft.Image, ErrorEnvelope> {

      if let error = addAttachmentError {
        return SignalProducer(error: error)
      }

      return SignalProducer(value: addAttachmentResponse ?? .template)
  }

  public func delete(image: UpdateDraft.Image, fromDraft draft: UpdateDraft)
    -> SignalProducer<UpdateDraft.Image, ErrorEnvelope> {

      if let error = removeAttachmentError {
        return SignalProducer(error: error)
      }

      return SignalProducer(value: removeAttachmentResponse ?? .template)
  }

  public func addVideo(file fileURL: URL, toDraft draft: UpdateDraft)
    -> SignalProducer<UpdateDraft.Video, ErrorEnvelope> {

      return .empty
  }

  public func changePaymentMethod(project: Project)
    -> SignalProducer<ChangePaymentMethodEnvelope, ErrorEnvelope> {

      if let error = self.changePaymentMethodResult?.error {
        return SignalProducer(error: error)
      }

      return SignalProducer(value: self.changePaymentMethodResult?.value ?? .template)
  }

  public func delete(video: UpdateDraft.Video, fromDraft draft: UpdateDraft)
    -> SignalProducer<UpdateDraft.Video, ErrorEnvelope> {

      return .empty
  }

  public func publish(draft: UpdateDraft) -> SignalProducer<Update, ErrorEnvelope> {
    if let error = publishUpdateError {
      return SignalProducer(error: error)
    }

    return SignalProducer(value: fetchUpdateResponse)
  }

  public func previewUrl(forDraft draft: UpdateDraft) -> URL? {
    return URL(
      string: "https://\(Secrets.Api.Endpoint.production)/projects/\(draft.update.projectId)/updates/"
        + "\(draft.update.id)/preview"
    )
  }
}

private extension MockService {
    enum lens {
    static let oauthToken = Lens<MockService, OauthTokenAuthType?>(
      view: { $0.oauthToken },
      set: {
        MockService(
          appId: $1.appId,
          serverConfig: $1.serverConfig,
          oauthToken: $0,
          language: $1.language,
          buildVersion: $1.buildVersion,
          changePaymentMethodResult: $1.changePaymentMethodResult,
          createPledgeResult: $1.createPledgeResult,
          facebookConnectResponse: $1.facebookConnectResponse,
          facebookConnectError: $1.facebookConnectError,
          fetchActivitiesResponse: $1.fetchActivitiesResponse,
          fetchActivitiesError: $1.fetchActivitiesError,
          fetchBackingResponse: $1.fetchBackingResponse,
          fetchGraphCategoriesResponse: $1.fetchGraphCategoriesResponse,
          fetchCommentsResponse: $1.fetchCommentsResponse,
          fetchCommentsError: $1.fetchCommentsError,
          fetchConfigResponse: $1.fetchConfigResponse,
          fetchDiscoveryResponse: $1.fetchDiscoveryResponse,
          fetchDiscoveryError: $1.fetchDiscoveryError,
          fetchFriendsResponse: $1.fetchFriendsResponse,
          fetchFriendsError: $1.fetchFriendsError,
          fetchFriendStatsResponse: $1.fetchFriendStatsResponse,
          fetchFriendStatsError: $1.fetchFriendStatsError,
          fetchExportStateResponse: $1.fetchExportStateResponse,
          fetchExportStateError: $1.fetchExportStateError,
          exportDataError: $1.exportDataError,
          fetchDraftResponse: $1.fetchDraftResponse,
          fetchDraftError: $1.fetchDraftError,
          addAttachmentResponse: $1.addAttachmentResponse,
          addAttachmentError: $1.addAttachmentError,
          removeAttachmentResponse: $1.removeAttachmentResponse,
          removeAttachmentError: $1.removeAttachmentError,
          publishUpdateError: $1.publishUpdateError,
          fetchMessageThreadResult: $1.fetchMessageThreadResult,
          fetchMessageThreadsResponse: $1.fetchMessageThreadsResponse,
          fetchProjectActivitiesResponse: $1.fetchProjectActivitiesResponse,
          fetchProjectActivitiesError: $1.fetchProjectActivitiesError,
          fetchProjectResponse: $1.fetchProjectResponse,
          fetchProjectNotificationsResponse: $1.fetchProjectNotificationsResponse,
          fetchProjectsResponse: $1.fetchProjectsResponse,
          fetchProjectsError: $1.fetchProjectsError,
          fetchProjectStatsResponse: $1.fetchProjectStatsResponse,
          fetchProjectStatsError: $1.fetchProjectStatsError,
          fetchShippingRulesResult: $1.fetchShippingRulesResult,
          fetchUserProjectsBackedResponse: $1.fetchUserProjectsBackedResponse,
          fetchUserProjectsBackedError: $1.fetchUserProjectsBackedError,
          fetchUserResponse: $1.fetchUserResponse,
          fetchUserError: $1.fetchUserError,
          fetchUserSelfResponse: $1.fetchUserSelfResponse,
          followFriendError: $1.followFriendError,
          incrementVideoCompletionError: $1.incrementVideoCompletionError,
          incrementVideoStartError: $1.incrementVideoStartError,
          fetchSurveyResponseResponse: $1.fetchSurveyResponseResponse,
          fetchSurveyResponseError: $1.fetchSurveyResponseError,
          fetchUnansweredSurveyResponsesResponse: $1.fetchUnansweredSurveyResponsesResponse,
          fetchUpdateCommentsResponse: $1.fetchUpdateCommentsResponse,
          fetchUpdateResponse: $1.fetchUpdateResponse,
          fetchUserSelfError: $1.fetchUserSelfError,
          postCommentResponse: $1.postCommentResponse,
          postCommentError: $1.postCommentError,
          loginResponse: $1.loginResponse,
          loginError: $1.loginError,
          resendCodeResponse: $1.resendCodeResponse,
          resendCodeError: $1.resendCodeError,
          resetPasswordResponse: $1.resetPasswordResponse,
          resetPasswordError: $1.resetPasswordError,
          signupResponse: $1.signupResponse,
          signupError: $1.signupError,
          submitApplePayResponse: $1.submitApplePayResponse,
          toggleStarResponse: $1.toggleStarResponse,
          toggleStarError: $1.toggleStarError,
          unfollowFriendError: $1.unfollowFriendError,
          updateDraftError: $1.updateDraftError,
          updatePledgeResult: $1.updatePledgeResult,
          updateProjectNotificationResponse: $1.updateProjectNotificationResponse,
          updateProjectNotificationError: $1.updateProjectNotificationError,
          updateUserSelfError: $1.updateUserSelfError
        )
      }
    )
  }
  // swiftlint:enable type_name
}
#endif
