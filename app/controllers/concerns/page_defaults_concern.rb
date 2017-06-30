module PageDefaultsConcern
  extend ActiveSupport::Concern
  
  included do
    before_action :set_page_defaults
  end
  
  def set_page_defaults
    @site_title = "Nathan Schulzke"
    @page_title = "Portfolio Site"
    @meta_description = "A portfolio site, created as a learning exersise while exploring Ruby on Rails using tutorials provided by Devcamp.com."
  end
end