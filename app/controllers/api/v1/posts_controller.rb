class Api::V1::PostsController < Api::V1::BaseController
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
