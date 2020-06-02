class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    # ViewのFormで取得したパラメータをモデルに渡す
    # @user_searches = Search.user_search(params[:search])
    # @book_searches = Search.book_search(params[:search])
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @records = search_for(@how, @model, @content)
  end

  def search
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

  def match(model, content)
    if model == 'user'
      User.where(name: content)
    elsif model == 'book'
      Book.where(title: content)
    end
  end

  def forward(model, content)
    if model == 'user'
      User.where("name LIKE ?", "#{content}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "#{content}%")
    end
  end

  def backward(model, content)
    if model == 'user'
      User.where("name LIKE ?", "%#{content}")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'user'
      User.where("name LIKE ?", "%#{content}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end
end
