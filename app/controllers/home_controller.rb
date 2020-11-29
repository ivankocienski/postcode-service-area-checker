# frozen_string_literal: true

class HomeController < ApplicationController
    def root; end

    def check
        @postcode_in_service_area = postcode_in_area?(params[:postcode])
    end

    private

    def postcode_in_area?(postcode_param)
        postcode_lookup = Postcode.new(postcode_param)
        if postcode_lookup.response_okay?

            return true if postcode_lookup.lsoa =~ /^Lambeth\b?/i
            return true if postcode_lookup.lsoa =~ /^Southwark\b?/i
        end

        return true if PostcodeAllowList.contains_postcode?(postcode_param)

        false
    end
end
