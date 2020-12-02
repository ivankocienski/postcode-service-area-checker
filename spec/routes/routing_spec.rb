# frozen_string_literal: true

require 'rails_helper'

describe 'Routing', type: :routing do
  context '/' do
    it 'routes to the root action' do
      expect(get: '/').to route_to('home#root')
    end
  end

  context '/check_postcode' do
    it 'routes to the check action' do
      expect(get: '/check_postcode').to route_to('home#check_postcode')
    end
  end
end
