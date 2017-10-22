class Api::V1::PostsController < Api::V1::BaseController
  def index
    page = (params[:page]).to_i
    per_page = (params[:per_page]).to_i
    if page == 0 || per_page == 0
      render json: @posts = Post.all
    else
      render json: @posts = Post.limit(per_page).offset((page-1)*per_page)
      response.headers['posts'] = "#{Post.count}"
      response.headers['pages'] = "#{Post.count/per_page}"
    end
  end

  def show
    render json: @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.published_at = DateTime.now unless @post.published_at

    if @post.save
      render json: @post, status: 201
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author, :published_at)
  end
end
