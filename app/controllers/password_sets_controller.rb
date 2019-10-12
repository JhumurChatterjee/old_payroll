class PasswordSetsController < ApplicationController
  before_action :set_organization
  def edit; end

  def update
    password = params[:password_set][:password]
    password_confirmation = params[:password_set][:password_confirmation]

    if password == password_confirmation && @organization.update(password: password)
      flash[:notice] = "Password Set !!!"
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def organization_params
    params.require(:password_set).permit(:password, :password_Confirmation)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
