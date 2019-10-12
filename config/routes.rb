class SubdomainConstraint   
  
  def self.matches?(request)     
    request.subdomain.present? && request.subdomain != 'www'   
  end 
end
 
Rails.application.routes.draw do
  constraints SubdomainConstraint do     
    resources "organizations" do
		  member do
		    post :create_user
		    get :new_user
		  end
    end  
  end
  get "home/index"
  root "home#index"
  resources "password_sets", only: [:edit, :update]
end
