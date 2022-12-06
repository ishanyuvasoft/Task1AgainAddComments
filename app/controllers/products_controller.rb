class ProductsController < ApplicationController

def index
    @products = Product.all
end    

def new
    @product = Product.all
end

def create
    #debugger
	@user = User.find(params[:user_id])
	@product = @user.products.create(product_params) 

	if @product.save
      redirect_to  root_path
    else
      render :new
    end
	
end

def show
    #debugger
    #@user = User.find(params[:user_id])
    @products = Product.all
end

def destroy
    #debugger
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to user_product_path(current_user)
end

private
    def product_params
    	params.require(:product).permit(:name, :price)
    end
	


end
