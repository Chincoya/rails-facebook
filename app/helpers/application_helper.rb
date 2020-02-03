# frozen_string_literal: true

module ApplicationHelper
  def poster(post)
    post.user.name
  end
end
