require 'rails_helper'

describe 'home/root', type: :view do
    it 'has a title' do
        render
        selector = "form[action='#{postcode_check_path}']"
        expect(rendered).to have_selector(selector)
    end
end
