require 'rails_helper'

describe 'home/check', type: :view do
    it 'has a response' do
        render
        expect(rendered).to have_content('(negative) This postcode is NOT in service area')
    end

    it 'shows positive response when flag set' do
        assign :postcode_in_service_area, true
        render
        expect(rendered).to have_content('(positive) This postcode IS in service area')
    end
end
