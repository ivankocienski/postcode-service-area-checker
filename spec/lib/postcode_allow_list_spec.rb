require 'rails_helper'

describe PostcodeAllowList do
    context 'with allowed postcode' do
        it 'is allowed' do
            response = PostcodeAllowList.contains_postcode?('sh24 1aa')
            expect(response).to be_truthy
        end
    end

    context 'with disallowed postcode' do
        it 'is not allowed' do
            response = PostcodeAllowList.contains_postcode?('xyz 123')
            expect(response).to be_falsey
        end
    end

    context 'with bad input' do
        it 'is not allowed' do
            [nil, '', '     '].each do |bad_text|
                response = PostcodeAllowList.contains_postcode?(bad_text)
                expect(response).to be_falsey
            end
        end
    end
end