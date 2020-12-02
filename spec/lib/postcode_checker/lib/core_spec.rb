require 'rails_helper'

describe PostcodeChecker::Core do
    context '#normalize_postcode_text' do
        it 'normalizes input' do
            response = PostcodeChecker::Core.normalize_postcode_text('sa7 8ah')
            expect(response).to eq 'SA78AH'
        end

        it 'deals with bad inputs' do
            [nil, '', '     '].each do |bad_text|
                response = PostcodeChecker::Core.normalize_postcode_text(bad_text)
                expect(response).to eq ''
            end
        end
    end
end