class TasksController < ApplicationController
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
        
        
            
        
        
       
        
      
        
end
 