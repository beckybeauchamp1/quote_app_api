class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
    render status: 200, json: @quotes
  end

  def show
    @quote = Quote.find(params[:id])
    render json: @quote
  end


  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      render status: 200, json: @quote.to_json
    end
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params)
      render status: 200, json: @quote.to_json
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    if @quote.destroy
      render status: 200, json: @quotes.to_json
    end
  end

  def find_authors
    @quotes = Quote.find_by_author(params[:author])
  end

  def find_authors
    @quotes = Quote.find_by_author(params[:author])
    if @quotes.length > 0
      render status: 200, json: @quotes.to_json
    else
      message = {
        message: "No Results Matching that Author Were Found"
      }
      render status: 200, json: message.to_json
    end
  end


  def find_matches
    @quotes = Quote.find_by_keyword(params[:key])
    if @quotes.length > 0
      render status: 200, json: @quotes.to_json
    else
      message = {
        message: "No Results Were Found"
      }
      render status: 200, json: message.to_json
    end
  end

  private
  def quote_params
    params.require(:quote).permit(:text, :author, :created_at, :updated_at)
  end

end
