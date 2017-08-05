module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def guest_user
      User.new(
        name: "Guest User",
        email: "guest@example.com",
        roles: "guest"
      )
    end

    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    protected
      def find_verified_user
        if verified_user = env['warden'].user
          verified_user
        end
      end
  end
end
