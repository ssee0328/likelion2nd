class HomeController < ApplicationController
  def index
    @posts=Post.all
    
  end

  def new
  end

  def create
    @post=Post.new
    @post.title=params[:post_title]
    @post.content=params[:post_content]
    @post.save
    
    redirect_to '/home/index'
  end
  
  def destroy
    post=Post.find(params[:post_id])
    post.destroy
    redirect_to '/home/index'
  end
  
  def show
    @post=Post.find(params[:post_id])
    # @comments=@post.comments.all
    

  end
  
  def commentcreate
    @comment=Comment.new
    @comment.content=params[:comment_content]
    @comment.post_id=params[:post_id]
    @comment.save
    
    # redirect_to '/'
    
    redirect_to '/home/show/%s'%[@comment.post_id]
  end

end
