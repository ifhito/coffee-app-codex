Dir[File.expand_path('../../packs/*/app/models/*.rb', __dir__)].each do |file|
  require file
end
