class ProductsController < ApplicationController
  def index
    @product = Product.paginate(page: params[:page])

  end

  def show
    @product = Product.find(params[:id])

  end

  def new
    @product = Product.new
    @product.reviews.new
    @product.variants.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product.variants.new

    #if @product.reviews.count == @product.reviews.pluck(:description).compact_blank.count
      #@product.reviews.new
    #end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    redirect_to product_path, status: :see_other

  end

  private
    
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, reviews_attributes: [:rating_id, :rating_type, :id, :description],
      variants_attributes: [:id, :size])
    end
end
