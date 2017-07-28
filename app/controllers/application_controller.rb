class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelistConcern
  include SetSourceConcern
  include CurrentUserConcern
  include PageDefaultsConcern

  add_flash_types :success, :info, :warning, :error
end
