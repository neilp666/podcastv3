class ReviewsController < ApplicationController
  before_action :find_podcast 
  before_action :find_review, only: [:edit, :update, :destroy]


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.podcast_id = @podcast.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to podcast_path(@podcast)
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @review.update(reviews_params)
      redirect_to podcast_path(@podcast)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to podcast_path(@podcast)
  end

  private



  def reviews_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
