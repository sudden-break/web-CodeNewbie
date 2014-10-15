module PodcastHelper

  def guest_name(episode)
    guests = episode.guests.select{|guest| guest.first_name != "Saron"}
    names = guests.collect do |guest|
      guest.full_name
    end
    names.join(", ")
  end
  
end
