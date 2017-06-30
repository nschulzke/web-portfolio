module DefaultTextConcern
  extend ActiveSupport::Concern
  
  included do
    before_action :set_title
  end
  
  def set_title
    @site_title = "Nathan Schulzke"
    @page_title = "Portfolio Site"
  end
end