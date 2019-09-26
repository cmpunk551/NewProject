class TodosController < ApplicationController
  	before_action :set_all_projects
    before_action :set_new_todo
    protect_from_forgery with: :null_session


  def index
  	@projects = Project.all
  	@todos = Todo.all
  	@todo = Todo.new
    respond_to do |format|
      format.html # show.html.erb
      format.json{
        render json: @projects
      }
    end

  end

  def update
    @todo_id= params[:todo][:todo_id]
    puts(@todo_id)
    @todo = Todo.find(@todo_id)
    if @todo.isCompleted
      @todo.update_attribute(:isCompleted, false)
    else
      @todo.update_attribute(:isCompleted, true)
    end
    redirect_to root_path
  end

  def create
  	@todo = Todo.new(todo_params)
  	@todo.project_id = params[:project_id]
	if @todo.save
  		redirect_to root_path
  	else
  		puts @todo.text
  	end
  end

  private 
  	def todo_params
  		params.require(:todo).permit(:text,:project_id,:isCompleted)
  	end 
    def set_new_todo
      @todo = Todo.new
      
    end
  	def set_all_projects
		@all_projects = Project.all.map{ |p| [p.title, p.id]}
	end 
end
