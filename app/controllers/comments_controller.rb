class CommentsController < ApplicationController
def index
 #debugger
 @product = Product.find(params[:product_id])
 @comments = @product.comments.all
end

def new
    #debugger
    @comment = Comment.new
end

def create
    #debugger
    @user = User.find(params[:user_id])
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user_id = current_user.id
    
     @comment.save
    redirect_to user_product_comments_path(current_user,@product)

end


def show
     @comment = Comment.find(params[:id])
end

def destroy
    #debugger
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_product_comments_path(current_user)
end

private
    def comment_params
    	params.require(:comment).permit(:title)
    end


end
