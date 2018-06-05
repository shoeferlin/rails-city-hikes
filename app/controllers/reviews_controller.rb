class ReviewsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @review = Review.new(review_params)
    @review.route = @route
    @review.user = current_user
    @new_review = Review.new
    authorize @review
    if @review.save
      calc_avg_rating(@route)
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
    @review = Review.find(params[:id])
    @route = Route.find(params[:route_id])
    authorize @review
    @review.destroy
    calc_avg_rating(@route)
    redirect_to route_path(@route)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def review_params_delete
    params.require(:id)
  end

  def calc_avg_rating(route)
    reviews = Review.where(route: route.id)
    rating_sum = 0
    counter = 0
    reviews.each do |r|
      unless r.rating.nil?
        rating_sum += r.rating.to_i
        counter += 1
      end
    end
    if counter.nil? || counter == 0
      new_avg_rating = 0
      Route.find(route.id).update(avg_rating: new_avg_rating)
    else
      new_avg_rating = (rating_sum / counter).round(2)
      Route.find(route.id).update(avg_rating: new_avg_rating)
    end
  end
end


