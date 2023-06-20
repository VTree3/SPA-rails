class TasksController < ApplicationController
  def login
    render "tasks/login/login"
  end
  def individual_login
    render "tasks/login/individual"
  end
  def company_login
    render "tasks/login/company"
  end
  def index
    @tasks = Task.all
    @task = Task.new
    #search function
    if params[:query].present?
      @tasks = Task.where("description like ?", "%#{params[:query]}%")
    else
      @tasks = Task.all
    end
    if turbo_frame_request?
      render partial: "task", locals: { task: @task }
    else
      render "index"
    end
    #end search function
  end
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
      else
        flash[:error] = @task.errors.full_messages
        format.html { redirect_to tasks_url, notice: "Task was not created due to error(s)" }
      end
    end
  end   
  def toggle  
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])
  end
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "Post was successfully deleted."
  end

  private
    def task_params
      params.require(:task).permit(:description, :completed)
    end
end  