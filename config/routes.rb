Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'twilio#index'

  match 'selection' => 'twilio#menu_selection', via: [:get, :post], as: 'selection'
end
