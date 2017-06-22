class Skill < ApplicationRecord
  include Placeholder
  
  validates_presence_of :title, :percent_focused
  
  after_initialize :set_defaults
  
  def set_defaults
    self.thumb_image ||= Placeholder.image_generator( height: '50', width: '50' )
  end
end
