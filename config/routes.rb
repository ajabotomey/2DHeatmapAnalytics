Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: redirect('https://en.wikipedia.org/wiki/HTTP_404')

  post '/tutoriallevel/upload', to: 'tutorial_level#upload_data'
  get 'tutoriallevel/download', to: 'tutorial_level#download_data'
end