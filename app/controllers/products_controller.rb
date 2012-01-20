class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end
  
#   def search
#     @products = Product.find_all_by_name(params[:name])
#     if @products.empty?
#       @products = Product.all
#       flash[:notice] = "Sorry, nothing found for #{params[:name]}."
#      # render :action => 'index'
#       @found = false
#     else
#      @found = true
#     # render :action => 'index'
#     end
#   end
  
  def index
    # reset the notfound boolean
    @found = false
    
    if params[:name].blank?
      @products = Product.all
    else
			@products = Product.find(:all, :conditions => ['LOWER(name) LIKE ? OR LOWER(description) LIKE ?', "%#{params[:name]}%", "%#{params[:name]}%"])
			if @products.empty?
				@products = Product.all
				if params[:name].blank?
				  flash.now[:notice] = "Sorry, nothing found."
				else
				  flash.now[:notice] = "Sorry, nothing found for #{params[:name]}."
				end
		  else
		    @found = true
		  end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, :notice => "Product #{@product.name} was deleted successfully."
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to @product, :notice  => "Product #{@product.name} was created successfully."
    else
      render :new
    end
  end
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product, :notice  => "Product #{@product.name} was updated successfully."
    else
      render :edit
    end
  end

end
