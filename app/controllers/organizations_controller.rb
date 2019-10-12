class OrganizationsController < ApplicationController
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
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def organization_params
    params.require(:organizations).permit(:name, :email)
  end
end
