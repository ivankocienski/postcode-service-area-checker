# frozen_string_literal: true

class HomeController < ApplicationController
    def root; end

    def check
        @postcode_in_service_area = PostcodeChecker.postcode_in_area?(params[:postcode])
    end
end
