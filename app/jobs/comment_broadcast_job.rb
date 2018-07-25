class CommentBroadcastJob < ApplicationJob
    queue_as :default

    def perform(comment)
        ActionCable.server.broadcast "notes_#{comment.note.id}_channel", comment: render_comment(comment)
    end

    def render_comment(comment)
        CommentsController.render partial: 'comments/comment', locals: { comment: comment }
    end
end