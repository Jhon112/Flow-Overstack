class CommentsController < ApplicationController
    before_action :load_commentable

    def new
        @comment = @commmentable.comments.new
    end

    def create
        @comment = @commentable.comments.new(comment_params)
        if @comment.save
            redirect_to @commentable, notice: "Comment created"
        else
            render :new
        end
    end

    private 
    def comment_params
        params.require(:comment).permit(:text).merge(user: current_user)
    end

    # def load_commentable
    #     resource, id = request.path.split("/")[1,2]
    #     @commentable = resource.singularize.classify.contastantize.find(id)
    # end

    def load_commentable
        klass = [Question, Answer].detect { |c| params["#{c.name.underscore}_id"]}
        @commentable = klass.find(params["#{klass.name.underscore}_id"])
    end
end
