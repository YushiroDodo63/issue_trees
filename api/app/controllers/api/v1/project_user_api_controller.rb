class Api::V1::ProjectUserApiController < ApplicationController
  #before_action :authenticate_api_user!

  def get_project_user
    @user = current_api_user
    project_users = @user.project_users
    projects = []
    for project_user in project_users
      project_id = project_user.project_id
      name = project_user.project.name
      id = project_user.project.id
      projects <<{
        project_id: project_id,
        name:name,
        id:id
    }
    end
    render json:projects
  end

  def get_project_users
    @project= Project.find(params[:id])
    users = @project.users
    project_users = []
    for project_user in users
      user_id = project_user.id
      name = project_user.name
      project_users <<{
        user_id: user_id,
        name:name,
    }
    end
    render json: project_users
  end

  def get_user_project
    @project= Project.find(params[:id])
    user_project = []
    project_name = @project.name
    project_id = @project.id
    user_project = {
      name: project_name,
      project_id: project_id,
    }
    render json:user_project
  end

  def edit_user_project
    @project_users = ProjectUser.find(params[:id])
    @project_users.id = edit_user_project_params[:id]
    @project_users.name = edit_user_project_params[:name]
    p @project_users
    @project_users.save!
  end


  private
    def edit_user_project_params
      params.require(:project_user_api).permit(:id ,:name)
    end

end