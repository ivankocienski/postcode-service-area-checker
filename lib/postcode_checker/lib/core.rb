module PostcodeChecker
    module Core
        module_function

        def postcode_in_area?(postcode_param)
            clean_text = normalize_postcode_text(postcode_param)

            return false unless valid_postcode_string?(clean_text)

            return false if Config.settings_empty?

            return true if postcode_in_allow_list?(clean_text)

            return true if postcode_in_lsoa?(clean_text)

            false
        end

        # helper methods

        def valid_postcode_string?(text)
            text =~ POSTCODE_PATTERN
        end

        def postcode_in_allow_list?(text)
            AllowList.contains_postcode? text
        end

        def postcode_in_lsoa?(text)
            return false if Config.lsoa_strings_empty?

            postcode_lookup = RemoteDataAPI.new(text)
            postcode_lookup.lookup_postcode

            if postcode_lookup.response_okay?
                allowed_lsoa_list.each do |lsoa_matcher|
                    return true if postcode_lookup.lsoa =~ lsoa_matcher
                end
            end

            false
        end

        def normalize_postcode_text(postcode_param)
            (postcode_param || '')
                .strip
                .gsub(/\s+/, '')
                .upcase
        end

        def allowed_lsoa_list
            @allowed_lsoa_list ||= Config.lsoa_strings.map { |string| /^#{string}\b?/i }
        end

        POSTCODE_PATTERN = /^[A-Z0-9]+$/.freeze
    end
end
