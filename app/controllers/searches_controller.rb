class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    #ViewのFormで取得したパラメータをモデルに渡す
    @user_searches = Search.user_search(params[:search])
    @book_searches = Search.book_search(params[:search])
  end


  def search
    @user_searches = User.search(params[:search])
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:name)
    end
end
