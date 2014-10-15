module PodcastHelper

  def guest_name(episode)
    episode.guests.select{|guest| guest.first_name != "Saron"}.each do |guest|
      return guest.full_name
    end
  end
  
end
