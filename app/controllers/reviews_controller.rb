class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to @review
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to review_path, status: :see_other

  end

  private
    
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:description)
    end
end
