Spree::Core::Engine.routes.draw do
      get 'kit/build' => 'sample_kits#build', :as => :sample_kit_build
      resources :sample_kits, :except => [:index, :show], :path => "kits" do
        post 'add' => 'sample_kits#add', :as => :add_to_cart
        post 'clear' => 'sample_kits#clear', :as => :clear
        collection do
          resources :sample_products, :shallow => true
        end
      end
end
