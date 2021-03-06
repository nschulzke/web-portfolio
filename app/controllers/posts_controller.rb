class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create, :show]
  before_action :set_sidebar_topics, except: [:create, :update, :destroy, :toggle_status]
  layout 'blog'
  access all: [:show, :index], site_admin: :all

  # GET /posts
  # GET /posts.json
  def index
    if logged_in? :site_admin
      @posts = Post.recent.page(params[:page]).per(5)
    else
      @posts = Post.recent.published.page(params[:page]).per(5)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.includes(:comments).friendly.find(params[:id])
    if logged_in? :site_admin || @blog.published?
      @comment = Comment.new

      @page_title = @post.title
    else
      redirect_to posts_path, warning: 'You are not authorized to access this page.'
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @post.draft?
      @post.published!
    else
      @post.draft!
    end
    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :topic_id, :status)
    end

    def set_sidebar_topics
      @sidebar_topics = Topic.with_posts
    end
end
