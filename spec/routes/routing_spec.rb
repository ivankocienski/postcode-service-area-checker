# frozen_string_literal: true

require 'rails_helper'

describe 'Routing', type: :routing do
    context '/' do
        it 'routes to the root action' do
            expect(get: '/').to route_to('home#root')
        end
    end

    context '/check' do
        it 'routes to the check action' do
            expect(get: '/check').to route_to('home#check')
        end
    end
end
