class CommentsController < ApplicationController
  def create
    @blogpost = Blogpost.find(params[:blogpost_id])
    @comment = @blogpost.comments.create(comment_params)
    redirect_to blogpost_path(@blogpost)
  end

  private
    def comment_params
      params.expect(comment: [ :commenter, :body ])
    end
end
