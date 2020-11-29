require 'rails_helper'

feature 'A user looking up a postcode that is in LSOA' do
    scenario 'will see the postcode is valid' do
        visit '/'

        fill_in 'Postcode', with: 'SE1 7QD'
        click_button 'Check'

        expect(page).to have_content('(positive) This postcode IS in service area')
    end
end
