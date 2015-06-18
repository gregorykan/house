class ReviewsController < ApplicationController
  before_filter :authenticate_user_from_token!

  def index
    @reviews = Review.all
    render json: { reviews: @reviews }
  end

  def show
    @review = Review.find(params[:id])
    render json: { review: @review }
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      track_activity(@review)
      render json: { review: @review }
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      track_activity(@review)
      render json: { review: @review }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    ActiveRecord::Base.transaction do
      track_activity(@review)
      @review.destroy
    end
    render status:200, json: {}
  end

  private
  def review_params
    params.require(:review).permit(:title, :text)
  end


end
