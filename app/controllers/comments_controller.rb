class CommentsController < ApplicationController
  respond_to :html

  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.create(comment_params)
    respond_with(@comment, location: report_path(@report))
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
