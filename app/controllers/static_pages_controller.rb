class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @animal = current_user.animals.build if logged_in?
      @food = current_user.foods.build if logged_in?

      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
