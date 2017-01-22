class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :check_post_author, only: [:edit, :update, :destroy]
    
    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to @post
            flash[:success] = "Successfully created new post"
        else
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def destroy
        @post.destroy
        redirect_to root_path
        flash[:success] = "Successfully deleted post"
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :body, hashtags_attributes: [:id, :name, :_destroy])
    end
    
    def find_post
        @post = Post.find(params[:id])
    end
    
    def check_post_author
        if current_user.id != @post.user_id
            redirect_to @post
            flash[:danger] = "Access forbidden!"
        end
    end
end
