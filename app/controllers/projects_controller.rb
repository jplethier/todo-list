class ProjectsController < AuthorizedController
  before_filter :populate_projects, only: [:edit, :new, :show]

  prepend_before_filter do
    params[:project] &&= project_params
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
  end

  def create
    if @project.save
      redirect_to project_path(@project), notice: t('strings.success')
    else
      flash.now[:error] = t('strings.error')
      render :new
    end
  end

  def add_task
    @task = @project.tasks.build
  end

  protected

  def populate_projects
    @projects = current_user.projects
  end

  def project_params
    params.require(:project).permit(:name)#, entries_attributes: [:id, :resource_type, :resource_id, :_destroy])
  end
end
