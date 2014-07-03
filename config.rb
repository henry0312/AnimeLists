require "lib/anime_lists"
activate :anime_lists

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

Dir.glob("#{config[:data_dir]}/Anime*[^C].json").each do |file|
  if /Anime(\d{4})Q(\d)\.json$/ =~ file
    year, quarter = $1, $2

    proxy "/#{year}/index.html", "/year_index.html",
      :locals => { :year => year }, :ignore => true

    proxy "/#{year}/Q#{quarter}/index.html", "/quarter_index.html",
      :locals => { :year => year, :quarter => quarter}, :ignore => true

    proxy "/#{year}/Q#{quarter}/titles.html", "/titles.html",
      :locals => { :year => year, :quarter => quarter}, :ignore => true

    proxy "/#{year}/Q#{quarter}/music.html", "/music.html",
      :locals => { :year => year, :quarter => quarter}, :ignore => true

    locations.keys.each do |locate|
      proxy "/#{year}/Q#{quarter}/#{locate}.html", "/local_anime.html",
        :locals => { :year => year, :quarter => quarter, :location => locate }, :ignore => true
    end
  end
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

set :relative_links, true

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
