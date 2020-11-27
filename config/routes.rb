# frozen_string_literal: true

Rails.application.routes.draw do
    root 'home#root'

    get '/check' => 'home#check', as: :postcode_check
end
