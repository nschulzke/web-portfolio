module PostsHelper
  def metadata_helper post
    "Published #{distance_of_time_in_words post.created_at, Time.now} ago"
  end

  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end
end
