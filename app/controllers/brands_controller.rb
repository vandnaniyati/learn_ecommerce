class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show 
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
    @brand.reviews.new
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to @brand
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @brand = Brand.find(params[:id])
    @brand.reviews.new
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update(brand_params)
      redirect_to @brand
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    redirect_to brand_path, status: :see_other

  end

  private
    
    def brand_params
      params.require(:brand).permit(:name, reviews_attributes: [:rating_id, :rating_type, :id, :description])
    end
end
