module RepliesHelper

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

end
