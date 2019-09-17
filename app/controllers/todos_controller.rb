class TodosController < ApplicationController
  	before_action :set_all_projects

  def index
  	@projects = Project.all
  	@todos = Todo.all
  	@todo = Todo.new

  end

  def update
    puts("ВОТ ТУДУ")
    @todo_id= params[:todo][:todo_id]
    puts(@todo_id)
    @todo = Todo.find(@todo_id)
    if @todo.isCompleted
      @todo.update_attribute(:isCompleted, false)
    else
      @todo.update_attribute(:isCompleted, true)
    end
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

  	def set_all_projects
		@all_projects = Project.all.map{ |p| [p.title, p.id]}
	end 
end
