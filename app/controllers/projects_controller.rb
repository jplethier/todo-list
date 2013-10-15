class ProjectsController < AuthorizedController
  before_filter :populate_projects, only: [:edit, :new, :show]

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
  end

  protected

  def populate_projects
    @projects = current_user.projects
  end
end
