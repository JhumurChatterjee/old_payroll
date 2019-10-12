class OrganizationsController < ApplicationController
  def index
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      flash[:notice] = "Email Sent !!!"
      redirect_to organizations_path
    else
      render "new"
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :email)
  end
end
