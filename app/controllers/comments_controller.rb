class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @event = @comment.event

    respond_to do |format|
      if @comment.save
        format.html {redirect_to event_path(@event), notice: 'コメントを投稿しました'}
        format.json{ render :show, status: :created, location: @comment }
        format.js {render :index}
      else
        format.html {render :new}
        format.json{render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

 private
  def comment_params
    params.require(:comment).permit(:event_id, :content)
  end
end
