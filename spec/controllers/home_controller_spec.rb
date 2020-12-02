# frozen_string_literal: true

require 'rails_helper'

describe HomeController, type: :controller do
  context '#root' do
    it 'renders root page' do
      get :root

      expect(response).to render_template('home/root')
    end
  end

  context '#check' do
    it 'renders check page' do
      get :check_postcode

      expect(response).to render_template('home/check_postcode')
    end

    it 'sets up postcode flag' do
      get :check_postcode, params: { postcode: 'se7 1qd' }
      expect(assigns[:postcode_in_service_area]).not_to be_nil
    end
  end
end
