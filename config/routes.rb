Rails.application.routes.draw do
  get 'sales', to: 'sales#index' # Esto es una ruta REST
  get 'sales/new'
  post 'sales', to: 'sales#create'# El numeral indica metodo de instancia
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
