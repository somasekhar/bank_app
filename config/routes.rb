Rails.application.routes.draw do

  get 'emi-schemes' => 'schemes#index'
  match 'import-banks-data' => 'schemes#import_banks_data', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
