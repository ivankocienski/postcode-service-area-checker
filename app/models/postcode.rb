class Postcode

    attr_reader :text

    def initialize(postcode)
        @text = postcode
    end

    def in_service_area?
        false
    end
end
