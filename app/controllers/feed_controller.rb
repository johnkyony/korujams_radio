class FeedController < ApplicationController
  def index
    @feed = Song.order('RANDOM()').paginate(page: params[:page], per_page: 15)
  end
end
