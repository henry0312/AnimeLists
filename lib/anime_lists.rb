class AnimeLists < Middleman::Extension

  @@locations = {
    "kansai" => "関西",
    "kantou" => "関東",
  }

  @@seasons = {
    1 => "冬",
    2 => "春",
    3 => "夏",
    4 => "秋"
  }

  @@anime_data_summary = {}

  def initialize(app, options_hash={}, &block)
    super

    app.set :locations, @@locations
    app.set :seasons, @@seasons

    # set anime_data_summary from data files' name
    Dir.glob("#{app.config[:data_dir]}/Anime*[^C].json").sort.each do |file|
      if /Anime(\d{4})Q(\d)\.json$/ =~ file
        year, quarter = $1, $2
        (@@anime_data_summary[year.to_i] ||= []) << quarter.to_i
      end
    end
  end

  helpers do
    def get_header_title(year, quarter)
      "#{year}年#{@@seasons[quarter.to_i]}アニメ"
    end

    def get_years
      return @@anime_data_summary.keys.sort
    end

    def get_quarters(year)
      return @@anime_data_summary[year.to_i].sort
    end

    def get_local_animes(year, quarter, channels)
      animes = []
      data["Anime#{year}Q#{quarter}"].each do |title, value|
        value['ch'].zip(value['date']).each do |ch, date|
          if channels.include?(ch)
            animes << {:title => title, :ch => ch, :date => date, :url => value['url']}
          end
        end
      end
      return animes.sort_by{|item| item[:date]}
    end

    def get_channels(*names)
      channels = []
      names.each do |name|
        channels += data[name]
      end
      return channels.zip((0..channels.size).to_a).to_h
    end

    def get_channels_kansai
      get_channels("channel_zenkoku", "channel_kansai", "channel_bs")
    end

    def get_channels_kantou
      get_channels("channel_zenkoku", "channel_kantou", "channel_bs")
    end
  end
end

::Middleman::Extensions.register(:anime_lists, AnimeLists)
