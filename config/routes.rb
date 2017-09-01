Rails.application.routes.draw do

    # get 'test_url', to: 'home#test'
    # get 'my_blog', to: 'home#test2'
    #
    # get '/all_articles', to: 'articles#all_articles'
    # get '/new_article', to: 'articles#new_article'
    #
    # get '/my_article/:id', to: 'articles#my_article'
    #
    # get '/edit_article/:id', to: 'articles#edit_article'
    #
    #  post '/create_article', to: 'articles#create_article'
     #
    #  post '/update_article', to: 'articles#update_article'
     #
    #  delete '/delete_article', to: 'articles#delete_article'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'


    resources :articles, :categories do
      member do
        post 'vote'
      end

      resources :comments do
        member do
          post 'vote'
        end
      end
    end

    resources :users do
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
