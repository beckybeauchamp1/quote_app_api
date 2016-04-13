class QuotesController < ApplicationController
  # skip_before_filter  :verify_authenticity_token
  def index
    @quotes = Quote.order("RANDOM()")
    @quotes = Quote.all
    # @quotes = @quotes.limit(10)
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

  def find_matches
    @quotes = Quote.find_by_keyword(params[:keyword])
    puts(params[:keyword])
    if @quotes.length > 0
      render status: 200, json: @quotes.to_json
    else
      message = {
        message: "No Results Matching that Author Were Found"
      }
      render status: 200, json: message.to_json
    end
  end

  def add_category
    @quote = Quote.find(params[:quote_id][:quote])
    puts @quote
    @category = Category.find(params[:quote_id][:category])
    puts @category
    @quote.categorizations.create!(quote_id: params[:quote_id][:quote], category_id: params[:quote_id][:category])
    render status: 200, json: @quote.categories.to_json
  end

  def categories
    @quote = Quote.find(params[:id])
    render status: 200, json: @quote.categories.to_json
  end

  private
  def quote_params
    params.require(:quote).permit(:text, :author, :created_at, :updated_at)
  end

end
