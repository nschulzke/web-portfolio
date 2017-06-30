module PageDefaultsConcern
  extend ActiveSupport::Concern
  
  included do
    before_action :set_page_defaults
  end
  
  def set_page_defaults
    @site_title = "Nathan Schulzke"
    @page_title = "Portfolio Site"
  end
end