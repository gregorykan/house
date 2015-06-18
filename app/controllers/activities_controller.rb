class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order(created_at: :desc).first(20)
    render json: { activities: @activities }
  end
end
