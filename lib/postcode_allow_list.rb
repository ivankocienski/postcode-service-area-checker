module PostcodeAllowList
    module_function

    ALLOW_LIST = %w[SH241AA SH241AB].freeze

    def contains_postcode?(text)
        clean_text = (text || '')
                     .strip
                     .gsub(/\s+/, '')
                     .upcase

        ALLOW_LIST.find_index(clean_text) != nil
    end
end