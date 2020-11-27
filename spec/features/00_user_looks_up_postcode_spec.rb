require 'rails_helper'

feature 'A user looking up a postcode' do
    scenario 'will see the postcode was valid' do
        visit '/'

        fill_in 'Postcode', with: 'XYZ 123'
        click_button 'Check'

        expect(page).to have_content('This postcode is in service area')
    end
end
