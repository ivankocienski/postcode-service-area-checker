require 'rails_helper'

describe 'home/check', type: :view do
    it 'has a title' do
        render
        expect(rendered).to have_content('This postcode is in service area')
    end
end
