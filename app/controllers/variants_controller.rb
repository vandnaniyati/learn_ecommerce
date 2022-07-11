class VariantsController < ApplicationController
  def index
    @variant = Variant.all
  end

  def show
    @variant = Variant.find(params[:id])
  end

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_params)

    if @variant.save
      redirect_to @variant
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @variant = Variant.find(params[:id])
  end

  def update
    @variant = Variant.find(params[:id])

    if @variant.update(variant_params)
      redirect_to @variant
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy

    redirect_to variant_path, status: :see_other

  end

  private
    
    # Only allow a list of trusted parameters through.
    def variant_params
      params.require(:variant).permit(:size)
    end
end
