module PostcodeChecker
  module Config
    module_function

    CONFIG_PATH = '/config/postcode_checker.yml'.freeze
    DEFAULT_LSOA_STRINGS = [].freeze
    DEFAULT_ALLOWED_POSTCODES = [].freeze

    def settings_path
      File.join(Rails.root, CONFIG_PATH)
    end

    def settings
      @settings ||= YAML.safe_load(File.read(settings_path))
    rescue Errno::ENOENT
      Rails.logger.error "ERROR: PostcodeChecker::Config > Could not read config file #{settings_path}"
      @settings = {}
    end

    def settings_empty?
      settings.empty?
    end

    def lsoa_strings
      settings['allowed_lsoa_list'] || DEFAULT_LSOA_STRINGS
    end

    def lsoa_strings_empty?
      lsoa_strings.empty?
    end

    def allow_postcodes
      settings['override_postcode_list'] || DEFAULT_ALLOWED_POSTCODES
    end

    def allow_postcodes_empty?
      allow_postcodes.empty?
    end

    # non database config

    def in_test_mode?
      Rails.env.test?
    end

    # fixed data

    def postcodes_io_endpoint
      'postcodes.io/postcodes/'
    end

    def postcodes_io_fake_data
      {
        'SE17QD' => { 'result' => { 'lsoa' => 'Southwark' } },
        'SE17QA' => { 'result' => { 'lsoa' => 'Lambeth' } }
      }
    end
  end
end