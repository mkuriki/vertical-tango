class ContactsController < ApplicationController
  def index
    redirect_to new_contact_path
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(i_params)

    if @contact.save
      name = params[:name]
      email = params[:email]
      comment = params[:comment]

      ApplicationMailer.welcome_email(@contact).deliver_now

      flash[:notice] = "Inquiry successfully submitted"
      redirect_to contacts_path
    else
      render :new
    end
  end

  private

  def i_params
    params.require(:contact).permit(
      :name,
      :email,
      :comment
    )
  end
end
