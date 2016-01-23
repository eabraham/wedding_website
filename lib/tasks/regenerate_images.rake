task :regenerate_images => :environment do
  Image.find_each do |ym|
    ym.photo.cache_stored_file!
    ym.photo.retrieve_from_cache!(ym.photo.cache_name)
    ym.photo.recreate_versions!
    ym.save!
  end
end
