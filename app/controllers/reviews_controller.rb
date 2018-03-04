class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to :back
    else
      # raise @review.errors.full_messages.inspect
      redirect_to :back, flash: { error: @review.errors.full_messages.first }
    end
  end

  def destroy
    delete_review = Review.find(params[:id]).destroy
    flash[:success] = 'Review deleted succcesfully.'
    redirect_to :back
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
