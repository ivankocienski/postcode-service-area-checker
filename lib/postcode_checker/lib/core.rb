module PostcodeChecker
    module Core
        module_function

        def postcode_in_area?(postcode_param)
            clean_text = normalize_postcode_text(postcode_param)
            return false if clean_text.empty?

            # local allow list
            return true if AllowList.contains_postcode?(clean_text)

            # check remote service
            postcode_lookup = RemoteDataAPI.new
            postcode_lookup.lookup_postcode clean_text

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
    end
end
