class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :update, :show]
  before_action :require_same_user, only:[:edit, :update]
    
  def index
    @chefs = Chef.paginate(page:params[:page], per_page: 3)
  end
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_parmas)
    if @chef.save 
      #do something
      flash[:success] = "your account was created succcessfully"
      session[:chef_id] = @chef.id
      redirect_to recipes_path
    else
      render 'new'
      
    end
  end
  
  def edit
    #@chef = Chef.find(params[:id])
  end
  
  def update
    #@chef = Chef.find(params[:id])
      if @chef.update(chef_params)
          flash[:success] = "Your account has been updated succcessfully"
          redirect_to chef_path(@chef) 
          render 'edit'
      end
  end
  
  def show
    #@chef = Chef.find(params[:id])
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 4) #Display only 4 recipe on index page
  end
  
  private 
    def chef_params
      params.require(:chef).permit(:name,:email,:password)
    end
    
    def require_same_user
      if current_user != @chef
        flash[:danger] = "you can only edit your own recipe"
        redirect_to root_path
      end
    end
    
    def set_chef
         @chef = Chef.find(params[:id])
    end
end
