# frozen_string_literal: true

# NewsController with all needed methods
class NewsController < ApplicationController
  include NewsHelper

  before_action :authenticate_user!, only: [:create]
  before_filter :require_permission, only: %i[edit delete]
  before_filter :find_news, except: %i[search index create new]

  def index
    # not such a good idea here to load all news in one-shot.
    # In future we can provide a pagination system, like
    # https://github.com/kaminari/kaminari or others.
    # Anyway, let's go in this simple way for now.
    @news = News.all
  end

  # added mainly for curiosity and check other stuff, like scopes and the rest
  def search
    search = params[:search]

    @news = News.search(search)

    flash[:notice] = 'The search did not return any results. Try again.' unless @news.any?

    render :index # render index for comfort
  end

  def show
    @user_can_edit = user_is_owner

    redirect_to :root unless @single_news
  end

  def new
    @single_news = News.new
  end

  def create
    @single_news = current_user.news.build(news_params)

    if @single_news.save
      redirect_to news_path(@single_news.id)
    else
      render :new
    end
  end

  def edit;end

  def update
    @single_news.update(news_params)

    if @single_news.save
      redirect_to news_path(@single_news.id)
    else
      render :edit
    end
  end

  def destroy
    if @single_news.destroy!
      redirect_to :root
    else
      render :show
    end
  end

  private

  def find_news
    @single_news = News.find_by(id: params[:id])
  end

  # Using a private method to encapsulate the permissible parameters is
  # a good pattern since you'll be able to reuse the same permit
  # list between create and update. Also, you can specialize this method
  # with per-user checking of permissible attributes.
  def news_params
    params.require(:news).permit(:title, :content)
  end
end
