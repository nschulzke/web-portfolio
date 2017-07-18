module PostsHelper
  def metadata_helper post
    "Published #{distance_of_time_in_words post.created_at, Time.now} ago"
  end
end
