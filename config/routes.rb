# frozen_string_literal: true

Rails.application.routes.draw do
    root 'home#root'

    get '/check_postcode' => 'home#check_postcode', as: :check_postcode
end
