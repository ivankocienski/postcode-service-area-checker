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
            get :check

            expect(response).to render_template('home/check')
        end
    end
end
