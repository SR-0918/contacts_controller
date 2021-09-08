class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
  
    def create
      @contact = Contact.new(
         contact_params
      )
      if @contact.save
          ContactMailer.contact_mail(@contact).deliver
          flash[:notice] = "送信しました"
          redirect_to("/contacts")
      else
          flash[:notice] = "送信に失敗しました"
          redirect_to("/contacts")
      end
    end
  
    def contact_template
    end
  
    private
  
    def contact_params
      params.permit(:name, :message, :url, :title, :service, :operation, :email)
    end
  
  end