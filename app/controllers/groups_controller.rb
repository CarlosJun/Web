class GroupsController < ApplicationController
    before_action :require_user, only: [:edit,:destroy,:new,:myshow]
    before_action :load_group, only: [:edit,:update,:destroy,:show,:addEmail,:listEmail,:createEmail]
    before_filter :check_for_cancel, only: [:create,:update]
    
    
    def index
        @groups = Group.all
        if params[:search]
          @groups = Group.search(params[:search]).order("created_at DESC")
        else
          @groups = Group.all.order('created_at DESC')
        end
    end
    
    def groups
        @groups = Group.all
    end
    
    def show
        @email = Email.new
    end
    
    def myshow
        @groups = current_user.groups
    end
    
    def new 
        @group = Group.new
    end
    
    def create
        @group = current_user.groups.build(group_params)
        if @group.save
          redirect_to @group
        else
          render 'new'
        end
    end
    
    def createEmail
      @email = Email.find_by_adreess(params[:address])
      @email.group_id = @group.id
    end
    
    def edit 
        if current_user.groups.exists?(@group) || current_user.role == "admin"
        else
           redirect_to(:action => 'show', :id => @group.id, notice: 'Não é possível editar este evento!')
        end
    end
    
    def update 
        if @group.update_attributes(group_params) || current_user.role == "admin"
             redirect_to(:action => 'show', :id => @group.id) 
        else 
             redirect_to groups_path, notice: 'Não é possível excluir este evento!' 
        end 
    end
    
    def destroy
        if current_user.groups.exists?(@group) || current_user.role == "admin"
            if @group.destroy
                redirect_to groups_path, notice: 'Evento excluido!'
            else
                redirect_to groups_path, alert: 'Não foi possivel excluir!'
            end
        else
            redirect_to groups_path, notice: 'Não é possível excluir este evento!'
        end
    
    end
    
    def addEmail
        @email = Email.new
    end
    
    def listEmail
        @emails = @group.emails
    end 
            
    
    private 
    def group_params 
        params.require(:group).permit(:title, :description, :size, :schedule, :image) 
    end
    
    def check_for_cancel
      redirect_to(:action => 'show', :id => @group.id) if params[:cancel]
    end
    
    def load_group
        @group = Group.find(params[:id])
    end
    
end
