class ReviewsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @review = Review.new(review_params)
    @review.route = @route
    @review.user = current_user
    @new_review = Review.new
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to route_path(@route) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render routes_path }
        format.js
      end
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end


