import Prelude
import Foundation

extension Comment {
  public enum lens {
    public static let author = Lens<Comment, Author>(
      view: { $0.author },
      set: { Comment(author: $0, body: $1.body, createdAt: $1.createdAt, deleted: $1.deleted, id: $1.id,
                     parentId: $1.parentId, replies: $1.replies ) }
    )

    public static let body = Lens<Comment, String>(
      view: { $0.body },
      set: { Comment(author: $1.author, body: $0, createdAt: $1.createdAt, deleted: $1.deleted,
                     id: $1.id, parentId: $1.parentId, replies: $1.replies) }
    )

    public static let createdAt = Lens<Comment, TimeInterval>(
      view: { $0.createdAt },
      set: { Comment(author: $1.author, body: $1.body, createdAt: $0, deleted: $1.deleted, id: $1.id,
                     parentId: $1.parentId, replies: $1.replies) }
    )

    public static let deletedAt = Lens<Comment, Bool>(
      view: { $0.deleted },
      set: { Comment(author: $1.author, body: $1.body, createdAt: $1.createdAt, deleted: $0, id: $1.id,
                     parentId: $1.parentId, replies: $1.replies) }
    )

    public static let id = Lens<Comment, Int>(
      view: { $0.id },
      set: { Comment(author: $1.author, body: $1.body, createdAt: $1.createdAt, deleted: $1.deleted,
                     id: $0, parentId: $1.parentId, replies: $1.replies) }
    )

    public static let parentId = Lens<Comment, Int?>(
      view: { $0.parentId },
      set: { Comment(author: $1.author, body: $1.body, createdAt: $1.createdAt, deleted: $1.deleted,
                     id: $1.id, parentId: $0, replies: $1.replies) }
    )

    public static let replies = Lens<Comment, CommentRepliesConnection?>(
      view: { $0.replies },
      set: { Comment(author: $1.author, body: $1.body, createdAt: $1.createdAt, deleted: $1.deleted,
                     id: $1.id, parentId: $1.parentId, replies: $0) }
    )
  }
}
