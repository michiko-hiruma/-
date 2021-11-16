class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy)
  before_action :logged_in_user
  before_action :correct_user

    def index
        @tasks = current_user.tasks.all.sort.reverse
    end
    
    def new
        @task = Task.new
    end
    
    def create
        
        @task = current_user.tasks.new(task_params)
        
        if @task.save
            flash[:notice] = "保存出来ました。"
            redirect_to tasks_url(id: current_user.id)
        else
            flash.now[:danger] ="保存出来ませんでした。"
            render :new
            
        end
    end
    def edit
        @task = Task.find(params[:id])
    end
        
    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to task_url
        else
            render :edit
        end
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      flash[:success] = "#{@task.name}のデータを削除しました。"
      redirect_to tasks_url
    end
    
    private
    
    def task_params
      params.require(:task).permit(:name, :detail)
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_task
      unless @task = @user.tasks.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url @user
      end
    end
end
 