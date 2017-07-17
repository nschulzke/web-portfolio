module CurrentUserConcern
  extend ActiveSupport::Concern
  
  def current_user
    super || guest_user
  end
  
  def guest_user
    User.new(
      name: "Guest User",
      email: "guest@example.com",
      roles: "guest"
    )
  end
end