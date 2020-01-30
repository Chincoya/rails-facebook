# frozen_string_literal: true

module PostsHelper
  def poster(post)
    User.find(post.user_id).name
  end
end
