class CommentsController < ApplicationController

	before_action :find_event

	def new
		@comment = @event.comments.build
	end

	def create
		@comment = @event.comments.build( comment_params )
		if @comment.save
			flash[:notice] = "新增成功"
			redirect_to event_comment_url( @event )
		else
			render :action => :new
		end
	end

	def edit
		@comment = @event.comments.find( params[:id] )
	end

	def update
			@comment = @event.comments.find( params[:id] )
		if @comment.update( coment_params )
			flash[:notice] = "編輯成功"
	    redirect_to event_comments_url( @event )
	  else
	    render :action => :edit
	  end
	end

	def destroy
	  @comment = @event.comments.find( params[:id] )
	  @comment.destroy

	  redirect_to event_comments_url( @event )
	end


	private

	def find_event
		@event = Event.find( params[:event_id] )
	end

	def comment_params
		params.require(:comment).permit(:name)
	end

end
