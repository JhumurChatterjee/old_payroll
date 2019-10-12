class OrganizationsController < ApplicationController
  before_action :set_organization, only: :create_user
  def index
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      OrganizationMailer.with(organization: @organization).welcome_email.deliver_now!
      flash[:notice] = "Email Sent !!!"
      redirect_to new_user_organization_path(id: @organization.id)
    else
      render "new"
    end
  end

  def create_user
    @user = @organization.users.new(user_params)

    if @user.save
      if @organization.users.length == 0
        @user.admin = true
      end
      flash[:notice] = "User created !!!"
      redirect_to root_path
    end
  end

  private

  def organization_params
    params.require(:organizations).permit(:name, :email)
  end

  def user_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
