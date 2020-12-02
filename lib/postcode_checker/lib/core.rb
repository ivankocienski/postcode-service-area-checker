module PostcodeChecker
    module Core
        module_function

        def postcode_in_area?(postcode_param)
            clean_text = normalize_postcode_text(postcode_param)
            return false if clean_text.empty?

            # check remote service
            postcode_lookup = RemoteDataAPI.new
            postcode_lookup.lookup_postcode clean_text

            if postcode_lookup.response_okay?

                return true if postcode_lookup.lsoa =~ /^Lambeth\b?/i
                return true if postcode_lookup.lsoa =~ /^Southwark\b?/i
            end

            # local allow list
            return true if AllowList.contains_postcode?(clean_text)

            false
        end

        def normalize_postcode_text(postcode_param)
            (postcode_param || '')
                .strip
                .gsub(/\s+/, '')
                .upcase
        end
    end
end
