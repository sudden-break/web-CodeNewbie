class Activity < ActiveRecord::Base
  belongs_to :content, polymorphic: true

  belongs_to :podcast, :foreign_key => :content_id, :foreign_type => "Podcast" 
  belongs_to :chat, :foreign_key => :content_id, :foreign_type => "Chat" 

end
