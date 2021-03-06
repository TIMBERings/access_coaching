class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :set_post, only: [:show, :edit, :update, :destroy, :vote]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new(post: @post, author: current_user)
    @post.viewed_by(current_user)
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.videos.build
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
        video_params.each do |v|
          Video.create(post: @post, video_id: v[:video_id])
        end
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
      format.html { redirect_to posts_video_id, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #->Prelang (voting/acts_as_votable)
  def vote
    direction = params[:direction]
    @post.cast_vote(direction, current_user)
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :is_public, :sport_id, :title, :author_id, video_attributes: [ :video_id ])
  end

  def video_params
    params.require(:post).require(:videos).permit(:video_id)
  end
end
