Rails.application.routes.draw do
  # root 'devise/sessions#new'
  root 'dojos#index'
  devise_for :managers
  resources :dojos do
    resources :students
  end
end


# Prefix                            Verb   URI Pattern                                                                              Controller#Action
# =====================================================================================================================================================
# root                              GET    /                                                                                        devise/sessions#new
# --------------------------------------------------------------------------------------------------------------------------------- [ Students Routes ]
# dojo_students                     GET    /dojos/:dojo_id/students(.:format)                                                       students#index
#                                   POST   /dojos/:dojo_id/students(.:format)                                                       students#create
# new_dojo_student                  GET    /dojos/:dojo_id/students/new(.:format)                                                   students#new
# edit_dojo_student                 GET    /dojos/:dojo_id/students/:id/edit(.:format)                                              students#edit
# dojo_student                      GET    /dojos/:dojo_id/students/:id(.:format)                                                   students#show
#                                   PATCH  /dojos/:dojo_id/students/:id(.:format)                                                   students#update
#                                   PUT    /dojos/:dojo_id/students/:id(.:format)                                                   students#update
#                                   DELETE /dojos/:dojo_id/students/:id(.:format)                                                   students#destroy
# --------------------------------------------------------------------------------------------------------------------------------- [ Devise Routes ]
# new_manager_session               GET    /managers/sign_in(.:format)                                                              devise/sessions#new
# manager_session                   POST   /managers/sign_in(.:format)                                                              devise/sessions#create
# destroy_manager_session           DELETE /managers/sign_out(.:format)                                                             devise/sessions#destroy
# new_manager_password              GET    /managers/password/new(.:format)                                                         devise/passwords#new
# edit_manager_password             GET    /managers/password/edit(.:format)                                                        devise/passwords#edit
# manager_password                  PATCH  /managers/password(.:format)                                                             devise/passwords#update
#                                   PUT    /managers/password(.:format)                                                             devise/passwords#update
#                                   POST   /managers/password(.:format)                                                             devise/passwords#create
# cancel_manager_registration       GET    /managers/cancel(.:format)                                                               devise/registrations#cancel
# new_manager_registration          GET    /managers/sign_up(.:format)                                                              devise/registrations#new
# edit_manager_registration         GET    /managers/edit(.:format)                                                                 devise/registrations#edit
# manager_registration              PATCH  /managers(.:format)                                                                      devise/registrations#update
#                                   PUT    /managers(.:format)                                                                      devise/registrations#update
#                                   DELETE /managers(.:format)                                                                      devise/registrations#destroy
#                                   POST   /managers(.:format)                                                                      devise/registrations#create
# new_manager_confirmation          GET    /managers/confirmation/new(.:format)                                                     devise/confirmations#new
# manager_confirmation              GET    /managers/confirmation(.:format)                                                         devise/confirmations#show
#                                   POST   /managers/confirmation(.:format)                                                         devise/confirmations#create
# --------------------------------------------------------------------------------------------------------------------------------- [ Dojos Routes ]
#     dojos                         GET    /dojos(.:format)                                                                         dojos#index
#                                   POST   /dojos(.:format)                                                                         dojos#create
#  new_dojo                         GET    /dojos/new(.:format)                                                                     dojos#new
# edit_dojo                         GET    /dojos/:id/edit(.:format)                                                                dojos#edit
#      dojo                         GET    /dojos/:id(.:format)                                                                     dojos#show
#                                   PATCH  /dojos/:id(.:format)                                                                     dojos#update
#                                   PUT    /dojos/:id(.:format)                                                                     dojos#update
#                                   DELETE /dojos/:id(.:format)                                                                     dojos#destroy
# --------------------------------------------------------------------------------------------------------------------------------- [ Helper Routes ]
# rails_service_blob                GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation         GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
# rails_disk_service                GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service         PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
# rails_direct_uploads              POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create