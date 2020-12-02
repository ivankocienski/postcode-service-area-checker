require 'rails_helper'

describe PostcodeChecker::AllowList do
  context 'with allowed postcode' do
    it 'is allowed' do
      response = PostcodeChecker::AllowList.contains_postcode?('SH241AA')
      expect(response).to be_truthy
    end
  end

  context 'with disallowed postcode' do
    it 'is not allowed' do
      response = PostcodeChecker::AllowList.contains_postcode?('XYZ123')
      expect(response).to be_falsey
    end
  end
end