require 'rails_helper'

describe PostcodeAllowList do
    context 'with allowed postcode' do
        it 'is allowed' do
            response = PostcodeAllowList.contains_postcode?('SH241AA')
            expect(response).to be_truthy
        end
    end

    context 'with disallowed postcode' do
        it 'is not allowed' do
            response = PostcodeAllowList.contains_postcode?('XYZ123')
            expect(response).to be_falsey
        end
    end
end