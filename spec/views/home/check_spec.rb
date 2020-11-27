require 'rails_helper'

describe 'home/check', type: :view do
    it 'has a response' do
        render
        expect(rendered).to have_content('(negative) This postcode is NOT in service area')
    end
end
