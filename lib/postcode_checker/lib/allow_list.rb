module PostcodeChecker
    module AllowList
        module_function

        def contains_postcode?(clean_text)
            return false if Config.allow_postcodes_empty?

            allowed_postcodes.find_index(clean_text) != nil
        end

        def allowed_postcodes
            @allowed_postcodes ||= Config.allow_postcodes.map { |text| text.gsub(/\s+/, '').upcase }
        end
    end
end