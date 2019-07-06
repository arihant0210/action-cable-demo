class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  has_many :send_messages, class_name: :Message, foreign_key: :sender_id
  has_many :received_messages, class_name: :Message, foreign_key: :receiver_id
  has_many :messages, dependent: :destroy
end
