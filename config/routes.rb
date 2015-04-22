Rails.application.routes.draw do
  resources :alums
  root :to => "alums#index"
end
