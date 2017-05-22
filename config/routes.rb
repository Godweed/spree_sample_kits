Spree::Core::Engine.routes.draw do
      resources :sample_kits do
        post 'add' => 'sample_kits#add', :as => :add_to_cart
        post 'clear' => 'sample_kits#clear', :as => :clear
        collection do
          resources :sample_products, :shallow => true
        end
      end
end
