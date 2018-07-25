class NotesChannel < ApplicationCable::Channel
    def subscribed
        stream_from "notes_#{params['note_id']}_channel"
    end

    def unsubscribed
    end

    def send_comment(data)
        current_user.comments.create!(content: data['comment'], note_id: data['note_id'])
    end
end