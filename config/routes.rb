Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resource :bdaywishes do 
get "get_token"
get "get_updates"
get "get_access_token"

end

end
