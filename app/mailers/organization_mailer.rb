class OrganizationMailer < ApplicationMailer
  def welcome_email
    @organization = params[:organization]
    @url  = edit_password_set_url(id: @organization.id)
    mail(to: @organization.email, subject: "Welcome To Payroll")
  end
end
