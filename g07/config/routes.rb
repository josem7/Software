Rails.application.routes.draw do
  get 'messages/show'
    match 'users/messages/:id', to: 'messages#show', via: 'get'
  get 'messages/create'

  match '/:user_id/messages/new', to: 'messages#new', via: 'get'
  match '/:user_id/messages/create', to: 'messages#create', via: 'post'
  match '/messages/:id/destroy', to: 'messages#destroy', via: 'get'

  get 'messages/destroy'

  match '/:user_id/remove', to: 'messages#destroy', via: 'get'

  resources :clases_buscos

  get 'join_grupo_estudios/new'
  get 'join_clases_buscos/new'
  get 'join_clases_ofrezcos/new'

  resources :clases_ofrezcos

  get 'favourites/new'

  get 'favourites/create'

  get 'favourites/destroy'

  get 'admin/new'

  get 'moderators/new'

  get 'moderators/create'

  get 'comment_likes/new'

  get 'comments/new'

  get 'likes/new'

  resources :sala_ocupadas
  resources :grupo_estudios
  get 'publications/new'

  match '/campus/:campu_id/rooms/:id', to: 'rooms#update', via: 'patch'
  match 'campus/:campu_id/rooms/new', to: 'rooms#new', via: 'get'

  match '/campus/:campu_id/rooms/:room_id/grupo_estudios/:id', to: 'grupo_estudios#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/grupo_estudios/new', to: 'grupo_estudios#new', via: 'get'

  match '/campus/:campu_id/rooms/:room_id/clases_ofrezcos/:id', to: 'clases_ofrezcos#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/clases_ofrezcos/new', to: 'clases_ofrezcos#new', via: 'get'

  match '/campus/:campu_id/rooms/:room_id/clases_buscos/:id', to: 'clases_buscos#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/clases_buscos/new', to: 'clases_buscos#new', via: 'get'

  match '/campus/:campu_id/rooms/:room_id/sala_ocupadas/:id', to: 'sala_ocupadas#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/sala_ocupadas/new', to: 'sala_ocupadas#new', via: 'get'

  match '/cursos/:curso_id/grupo_estudios/:id/unirme_cursos', to: 'join_grupo_estudios#unirme_cursos', via: 'get'
  match '/cursos/:curso_id/grupo_estudios/:id/abandonar_cursos', to: 'join_grupo_estudios#abandonar_cursos', via: 'get'

  match '/cursos/:curso_id/clases_buscos/:id/unirme_cursos', to: 'join_clases_busco#unirme_cursos', via: 'get'
  match '/cursos/:curso_id/clases_buscos/:id/abandonar_cursos', to: 'join_clases_busco#abandonar_cursos', via: 'get'

  match '/cursos/:curso_id/clases_ofrezcos/:id/unirme_cursos', to: 'join_clases_ofrezco#unirme_cursos', via: 'get'
  match '/cursos/:curso_id/clases_ofrezcos/:id/abandonar_cursos', to: 'join_clases_ofrezco#abandonar_cursos', via: 'get'

  match '/campus/:campu_id/rooms/:room_id/clases_ofrezcos/:id/unirme_sala', to: 'join_clases_ofrezco#unirme_sala', via: 'get'
  match '/campus/:campu_id/rooms/:room_id/clases_ofrezcos/:id/abandonar_sala', to: 'join_clases_ofrezco#abandonar_sala', via: 'get'

  match '/campus/:campu_id/rooms/:room_id/grupo_estudios/:id/unirme_sala', to: 'join_grupo_estudios#unirme_sala', via: 'get'
  match '/campus/:campu_id/rooms/:room_id/grupo_estudios/:id/abandonar_sala', to: 'join_grupo_estudios#abandonar_sala', via: 'get'

  match '/campus/:campu_id/rooms/:room_id/clases_buscos/:id/unirme_sala', to: 'join_clases_busco#unirme_sala', via: 'get'
  match '/campus/:campu_id/rooms/:room_id/clases_buscos/:id/abandonar_sala', to: 'join_clases_busco#abandonar_sala', via: 'get'

  match '/cursos/:curso_id/unsuscribe', to: 'join_cursos#unsuscribe', via: 'get'

  match '/users/:id/stats', to: 'users#stats', via: 'get'

  resources :campus do
    resources :rooms do
      resources :grupo_estudios
      resources :sala_ocupadas
      resources :clases_ofrezcos
      resources :clases_buscos
      resources :rates
    end
  end

  get 'rates/create'

  get 'home/index'

  get 'join_cursos/new'

  resources :campus do
    resources :rooms do
      resources :sala_ocupadas
      resources :clases_ofrezcos do
        resources :join_clases_ofrezcos
      end
      resources :clases_buscos do
        resources :join_clases_buscos
      end
      resources :grupo_estudios do
        resources :join_grupo_estudios
      end
    end
  end

  resources :cursos do
    resources :join_cursos
    resources :grupo_estudios
    resources :clases_buscos
    resources :clases_ofrezcos
    resources :publications do
      resources :comments
    end
  end

  get 'join_event/new'

  match '/campus/:campu_id/rooms/:id', to: 'rooms#update', via: 'patch'
  match 'campus/:campu_id/rooms/new', to: 'rooms#new', via: 'get'
  match '/campus/:campu_id/rooms/:room_id/grupo_estudios/:id', to: 'grupo_estudios#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/grupo_estudios/new', to: 'grupo_estudios#new', via: 'get'
  match '/campus/:campu_id/rooms/:room_id/clases_ofrezcos/:id', to: 'clases_ofrezcos#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/clases_ofrezcos/new', to: 'clases_ofrezcos#new', via: 'get'
  match '/campus/:campu_id/rooms/:room_id/clases_buscos/:id', to: 'clases_buscos#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/clases_buscos/new', to: 'clases_buscos#new', via: 'get'
  match '/campus/:campu_id/rooms/:room_id/sala_ocupadas/:id', to: 'sala_ocupadas#update', via: 'patch'
  match 'campus/:campu_id/rooms/:room_id/sala_ocupadas/new', to: 'sala_ocupadas#new', via: 'get'
  match '/cursos/:curso_id/publications/:id/like', to: 'likes#like', via: 'get'
  match '/cursos/:curso_id/publications/:id/dislike', to: 'likes#dislike', via: 'get'
  match '/cursos/:curso_id/publications/:publication_id/comments/:id/like', to: 'comment_likes#like', via: 'get'
  match '/cursos/:curso_id/publications/:publication_id/comments/:id/dislike', to: 'comment_likes#dislike', via: 'get'

  match '/cursos/:curso_id/create', to: 'moderators#create', via: 'get'
  match '/:curso_id/:user_id/accept', to: 'moderators#accept', via: 'get'
  match '/:curso_id/:user_id/reject', to: 'moderators#reject', via: 'get'
  match '/:curso_id/:user_id/remove', to: 'moderators#remove', via: 'get'

  match '/cursos/:curso_id/publications/:id/favourite', to: 'favourites#create', via: 'get'
  match '/cursos/:curso_id/publications/:id/d_favourite', to: 'favourites#destroy', via: 'get'

  resources :eventos
  resources :campus
  resources :cursos
  get 'users/show'

  root to: "home#index"

  devise_for :users
  resources :users

  resources :campus do
    resources :rooms do
      resources :grupo_estudios
      resources :sala_ocupadas
      resources :clases_ofrezcos
      resources :clases_buscos
      resources :rates
    end
  end

  resources :rooms do
    resources :grupo_estudios
    resources :sala_ocupadas
    resources :clases_ofrezcos
    resources :clases_buscos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_scope :user do
    authenticated :user do
      root 'application#hello', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

patch '/campus/:campu_id/rooms' => 'rooms#update'
end
