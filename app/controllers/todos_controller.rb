class TodosController < ApplicationController
  	before_action :set_all_projects

  def index
  	@projects = Project.all
  	@todos = Todo.all
  	@todo = Todo.new

  end

  def update
  end

  def create
  	puts "Я в контроллере мама"
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
  		params.require(:todo).permit(:text,:project_id)
  	end 

  	def set_all_projects
		@all_projects = Project.all.map{ |p| [p.title, p.id]}
	end 
end
