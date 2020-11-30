module PostcodeAllowList
    module_function

    ALLOW_LIST = %w[SH241AA SH241AB].freeze

    def contains_postcode?(clean_text)
        ALLOW_LIST.find_index(clean_text) != nil
    end
end