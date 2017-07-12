class SessionsController < ApplicationController
    
    def index
        @events = Event.all
        if params[:search]
          @events = Event.search(params[:search]).order("created_at DESC")
        else
          @events = Event.all.order('created_at DESC')
        end
        @groups = Group.all
        if params[:search]
          @groups = Group.search(params[:search]).order("created_at DESC")
        else
          @groups = Group.all.order('created_at DESC')
        end
    end
    
    def new
    end
    
    def create
    @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to '/login'
      end 
    end
    
    def destroy 
      session[:user_id] = nil 
      redirect_to '/' 
    end
    
end
