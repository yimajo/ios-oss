import Apollo
@testable import Kickstarter_Framework
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let apollo = ApolloClient(url: URL(string: "http://kickstarter.com/graph")!)

apollo.fetch(query: UserQuery()) { (result, error) in
    print(result?.data?.me)
    PlaygroundPage.current.finishExecution()
}
