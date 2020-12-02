module PostcodeChecker
    module Core
        module_function

        def postcode_in_area?(postcode_param)
            clean_text = normalize_postcode_text(postcode_param)

            return false unless valid_postcode_string?(clean_text)

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
            postcode_lookup = RemoteDataAPI.new
            postcode_lookup.lookup_postcode text

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
            @allowed_lsoa_list ||= ALLOWED_LSOA_LIST_STRINGS.map { |string| /^#{string}\b?/i }
        end

        ALLOWED_LSOA_LIST_STRINGS = %w[Lambeth Southwark].freeze
        POSTCODE_PATTERN = /^[A-Z0-9]+$/.freeze
    end
end
