class TodosController < ApplicationController
  	before_action :set_all_projects
    protect_from_forgery with: :null_session


  def index
  	@projects = Project.all
  	@todos = Todo.all
    @todos.order! 'created_at DESC'
  	@todo = Todo.new
    json = { :projects => @projects, :todos => @todos }.to_json
    respond_to do |format|
      format.html # show.html.erb
      format.json{
        render json: json
      }
    end

  end

  def update
    @todo_id= params[:id]
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
    if (params[:todo].has_key?(:ios))
      puts("ios работает")
      @todo = Todo.new
      @todo.text = params[:todo][:text]
      @todo.project_id = params[:todo][:project_id].to_i
      @todo.isCompleted = false
    else
      puts("запрос из вэб и андройд")
      @todo = Todo.new(todo_params)
      @todo_project_id = params[:project_id]
      @todo.project_id = @@todo_project_id.to_i
      @todo.isCompleted = false
    end
    
  	
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

  	def set_all_projects
		@all_projects = Project.all.map{ |p| [p.title, p.id]}
	end 
end
