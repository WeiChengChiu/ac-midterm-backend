class EventsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	before_action :set_event, :only => [:show, :edit, :update, :destroy]

	def index
		@events = Event.page(params[:page]).per(5)
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new( event_params )
		@event.user = current_user
		if @event.save
			flash[:notice] = "新增成功"
			redirect_to events_path
		else
			render :action => :new
		end
	end

	def show
		@comments = @event.comments
	end

	def edit
	end

	def update
		if @event.update( event_params )
			flash[:notice] = "編輯成功"
			redirect_to events_path
		else
			render :action => :edit
		end
	end

	def destroy
		if @event.destroy
			flash[:alert] = "刪除成功"
			redirect_to events_path
		else
			render :action => :index
		end
	end

	private

	def event_params
		params.require(:event).permit(:topic, :description, :category_id)
	end

	def set_event
		@event = Event.find( params[:id] )
	end

end
