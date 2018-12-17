class ProductsController < ApplicationController
before_action :authenticate_user!

 def new
 	@product = Product.new
 end

 def create
 	@product = current_user.products.build(product_params)
 	if @product.save
 	redirect_to root_path
 	 end	
 end

 def show
 	@product = Product.find_by(params[:id])
 end

 def edit
 	@product = Product.find_by(params[:id])
 	if @product.update(product_params)
      
      redirect_to root_path
    else
    
      render 'edit'
  end
 end

 def update
 	@product = Product.find_by(params[:id])

 end

 def destroy
 	@product = Product.find_by(params[:id])
 	@product.destroy
 	redirect_to root_path
 end

private
 def product_params
 	params.require(:product).permit(:user_id, :title, :description, :price)
 end
end
