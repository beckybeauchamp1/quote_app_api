class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorited_quotes
    puts @favorites
    render status: 200, json: @favorites.to_json
  end

  def create
    @favorite = Favorite.new()
    @quote = Quote.find(params[:id])
    current_user.favorites.create!(quote_id: params[:d])
    if @favorite.save
      render status: 200, json: @favorite.to_json
    end
  end

  def update
    @favorite = Favorite.find(params[:id])
    if @favorite.update(favorite_params)
      render status: 200, json: @favorite.to_json
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      render status: 200, json: @quotes.to_json
    end
  end


end
