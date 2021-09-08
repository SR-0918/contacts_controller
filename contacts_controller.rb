class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(
        **contact_params,
        name: params[:name],
        message: params[:message],
        url: params[:url],
        title: params[:title],
        service: params[:service],
        enviroment: params[:enviroment],
        operation: params[:operation],
        email: params[:email]
    )
    if @contact.save
        ContactMailer.contact_mail(@contact).deliver
        flash[:notice] = "送信しました"
        redirect_to("/contact")
    else
        flash[:notice] = "送信に失敗しました"
        redirect_to("/contact")
    end
  end

  def contact_template
  end

  private

  def contact_params
    params.permit(:name, :message, :url, :title, :service, :enviroment, :operation, :email)
  end

end
