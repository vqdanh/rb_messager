Rails.application.config.assets.precompile += %w( home.css )

%w( home messsages conversations ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end