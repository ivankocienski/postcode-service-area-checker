require 'rails_helper'

feature 'A user looking up a postcode' do
  scenario 'will see the postcode is invalid' do
    visit '/'

    fill_in 'Postcode', with: 'XYZ 123'
    click_button 'Check'

    expect(page).to have_content('(negative) This postcode is NOT in service area')
  end
end
