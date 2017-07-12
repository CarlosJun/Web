class EventsController < ApplicationController
    
    before_action :require_user, only: [:edit,:destroy,:new,:myshow]
    before_action :load_event, only: [:edit,:update,:destroy,:show]
    before_filter :check_for_cancel, only: [:create,:update]
    
    
    def index
        @events = Event.all
        if params[:search]
          @events = Event.search(params[:search]).order("created_at DESC")
        else
          @events = Event.all.order('created_at DESC')
        end
    end
    
    def events
        @events = Event.all
    end
    
    def show
    end
    
    def myshow
        @events = current_user.events
    end
    
    def new 
        @event = Event.new
    end
    
    def create
        @event = current_user.events.build(event_params)
        if @event.save
          redirect_to @event
        else
          render 'new'
        end
    end
    
    def edit 
        if current_user.events.exists?(@event) || current_user.role == "admin"
        else
           redirect_to(:action => 'show', :id => @event.id, notice: 'Não é possível editar este evento!')
       end
    end
    
    def update 
        if @event.update_attributes(event_params) || current_user.role == "admin"
             redirect_to(:action => 'show', :id => @event.id) 
        else 
             redirect_to events_path, notice: 'Não é possível excluir este evento!' 
        end 
    end
    
    def destroy
        if current_user.events.exists?(@event) || current_user.role == "admin"
            if @event.destroy
                redirect_to events_path, notice: 'Evento excluido!'
            else
                redirect_to events_path, alert: 'Não foi possivel excluir!'
            end
        else
            redirect_to events_path, notice: 'Não é possível excluir este evento!'
        end
    
    end
            
    
    private 
    def event_params 
        params.require(:event).permit(:title, :description, :date, :schedule, :image) 
    end
    
    def check_for_cancel
      redirect_to(:action => 'show', :id => @event.id) if params[:cancel]
    end
    
    def load_event
        @event = Event.find(params[:id])
    end
    
end
