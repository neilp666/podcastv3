class PodcastsController < ApplicationController
  before_action :find_podcast, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
       @podcasts = Podcast.all.order("created_at DESC")
    else
       @category_id = Category.find_by(name: params[:category]).id
       @podcasts = Podcast.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @podcast = current_user.podcasts.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @podcast = current_user.podcasts.build(podcast_params)
    @podcast.category_id = params[:category_id]

    if @podcast.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
     @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
  @podcast.category_id = params[:category_id]
    if @podcast.update(podcast_params)
      redirect_to podcast_path(@podcast)
    else
      render 'edit'
    end
  end

  def destroy
    @podcast.destroy
    redirect_to root_path
  end

  private 

  def podcast_params
    params.require(:podcast).permit(:title, :description, :host, :category_id, :podcast_img)
  end

  def find_podcast
    @podcast = Podcast.find(params[:id])
  end
end
