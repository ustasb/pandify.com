require 'pandora_data'

desc "Add PANDORA_IDS data to the database"
task :add_pandora_ids_data_to_db => :environment do
  PANDORA_IDS.each do |id|
    user = User.find_by(pandora_id: id)
    next if user.present? && user.latest_3_liked_tracks.any?

    pandora_data = PandoraData.new(id)
    next unless pandora_data.get_scraper

    puts "Retrieving data for #{id}..."
    pandora_data.get_liked_tracks
  end
end
