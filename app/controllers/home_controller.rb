# frozen_string_literal: true

class HomeController < ApplicationController
  def root; end

  def check_postcode
    @postcode_in_service_area = PostcodeChecker.postcode_in_area?(params[:postcode])
  end
end
