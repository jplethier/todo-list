class TasksController < AuthorizedController

  prepend_before_filter do
    params[:task] &&= task_params
  end

  def create
    @task.save
  end

  def update
    @task.update_attributes(task_params)
  end

  protected

  def task_params
    finished = params[:task].delete(:finished_at)
    if finished
      params[:task].merge!(finished_at: Date.today)
    else
      params[:task].merge!(finished_at: nil)
    end
    params.require(:task).permit(:description, :finished_at, :project_id)
  end
end
