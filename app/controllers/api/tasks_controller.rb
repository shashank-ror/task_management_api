module Api
class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy, :assign, :progress]

  def index
    @tasks = Task.order(created_at: :desc)
    render json: @tasks
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  def create
    @task = Task.new(task_params)
    #render json: {message: @task.priority}
    case @task.priority
    when 'high'
      @task.priority_order = 1
    when 'medium'
      @task.priority_order = 2
    when 'low'
      @task.priority_order = 3
    else
      @task.priority_order = 4
    end

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update

    puts task_update_params.inspect

    if task_update_params["status"] == 'completed'
      if @task.assigned_to.present?
      @task.completed_date = Date.today
    else
      render json: {message: "Task Cant be completed without assigning."}, status: :unprocessable_entity and return
    end
  end

    if @task.update(task_update_params)
      render json: @task
    else
        render json: @task.errors, status: :unprocessable_entity
    end
  end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      render json: {message: "Task Deleted."}
    end

    def assign
      user = User.find(params[:userId])
      @task.update(assigned_to: params[:userId])
      render json: @task
    end

    def progress
      @task.update(progress_params)
      render json: @task
    end

    def overdue
      @tasks = Task.where('due_date < ?', Date.today)
      render json: @tasks
    end

    def by_status
      @tasks = Task.where(status: params[:status])
      render json: @tasks
    end

    def completed_by_date
      start_date = Date.parse(params[:startDate])
      end_date = Date.parse(params[:endDate])
      @tasks = Task.where(completed_date: start_date..end_date)
      render json: @tasks
    end

    def statistics
      total_tasks = Task.count
      completed_tasks = Task.where(status: 'completed').count
      percentage_completed = (completed_tasks.to_f / total_tasks.to_f) * 100
      render json: { total_tasks: total_tasks, completed_tasks: completed_tasks, percentage_completed: percentage_completed }
    end

    def priority_queue
      @tasks = Task.all.order(priority_order: :asc, due_date: :desc)

      render json: @tasks
    end



    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status, :priority)
    end

    def task_update_params
      params.require(:task).permit(:title, :description, :due_date, :status)
    end

    def progress_params
      params.require(:task).permit(:progress, :status)
    end
  end
end
