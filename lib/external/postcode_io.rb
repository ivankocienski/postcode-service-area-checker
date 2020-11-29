require 'rest-client'

class Postcode
    private

    RESPONSE_CODE_FOUND = 200

    FAKE_DATA = {
        'SE17QD' => { 'result' => { 'lsoa' => 'Southwark' } },
        'SE17QA' => { 'result' => { 'lsoa' => 'Lambeth' } }
    }

    ENDPOINT = 'https://postcodes.io/postcodes/'.freeze

    def fetch_test!
        @response = {}
        @response_data = FAKE_DATA[text_normalized]
        @response_code = @response_data ? RESPONSE_CODE_FOUND : -1
    end

    def fetch_live!
        @response = RestClient.get(url)
        @response_data = JSON.parse(@response.body)
        @response_code = @response.code
    end

    public

    attr_reader :original, :response, :response_code, :response_data

    def initialize(text)
        @original = text || ''
        @response_code = -1
        @response_data = {}

        return if text_normalized.empty?

        if Rails.env.test?
            fetch_test!
        else
            fetch_live!
        end
    end

    def text_normalized
        @text_normalized ||=
            @original
            .strip
            .gsub(/\s+/, '')
            .upcase
    end

    def url
        @url ||= "#{ENDPOINT}#{text_normalized}"
    end

    ## outputs
    def response_okay?
        response_code == RESPONSE_CODE_FOUND
    end

    def lsoa
        response_data['result']['lsoa'] if response_okay?
    end
end
