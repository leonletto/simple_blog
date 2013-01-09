class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    list
    render :action => 'list'
  end

  def list
    @posts = Post.all
    @user_list = get_user_list

    #@post_pages, @posts = :posts, :per_page => 10
    #respond_to do |format|
    #  format.html # listhtml.erb
    #  format.json { render json: @posts }
    #end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user_list = get_user_list
    @action = 'show'
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @user_list = get_user_list
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @user_list = get_user_list
  end

  # POST /posts
  # POST /posts.json
  def create
    post_params = params[:post]
    author_id = post_params.delete(:author_id)
    @post = Post.new(post_params)
    @post.author = User.find(author_id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Blog post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    post_params = params[:post]
    author_id = post_params.delete(:author_id)
    @post = Post.find(params[:id])
    @user_list = get_user_list
    @post.author = User.find(author_id) if @post.author_id != author_id
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to posts_url, notice: 'Blog post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def get_user_list
    return User.all(:order => 'last_name ASC').collect { |user| [user.full_name, user.id]}
  end
end
