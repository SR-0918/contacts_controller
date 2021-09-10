class Contact < ApplicationRecord
    include ActiveModel::Model
    attr_accessor :name, :email, :message, :url, :title, :service, :communicate, :operation, :contactimage
    has_many_attached :contactimage
end
