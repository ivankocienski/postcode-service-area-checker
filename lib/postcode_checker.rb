module PostcodeChecker
    module_function

    def postcode_in_area?(postcode_param)
        clean_text = normalize_postcode_text(postcode_param)
        return false if clean_text.empty?

        postcode_lookup = Postcode.new(clean_text)
        if postcode_lookup.response_okay?

            return true if postcode_lookup.lsoa =~ /^Lambeth\b?/i
            return true if postcode_lookup.lsoa =~ /^Southwark\b?/i
        end

        return true if PostcodeAllowList.contains_postcode?(clean_text)

        false
    end

    module_function

    def normalize_postcode_text(postcode_param)
        (postcode_param || '')
            .strip
            .gsub(/\s+/, '')
            .upcase
    end
end
