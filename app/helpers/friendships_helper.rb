# frozen_string_literal: true

module FriendshipsHelper
  def friendship_linker(fri, user)
    ret = []
    if fri.nil?
      ret << link_to('Invite Friendship', friendships_path(params: { user: { user_id: user.id } }), method: :post)
    elsif fri.confirm.nil?
      ret << link_to('Reject Friendship', fri, method: :delete)
      ret << link_to('Accept Friendship', fri, method: :patch)
    else
      ret << link_to('Unfriend', fri, method: :delete)
    end
  end
end
