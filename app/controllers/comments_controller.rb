class CommentsController < ApplicationController
def create
	comment = Comment.new(:event_id => params[:event_id], :user_id => current_user.id, :comment => params[:comment])
	if comment.valid?
		comment.save
	else
		flash[:errors] = comment.errors.full_messages
	end
	redirect_to '/events/#{params[:event_id]}'
end
end
