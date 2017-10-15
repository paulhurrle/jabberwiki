class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable

  has_many :wikis
  has_many :collaborators

  enum role: [:standard, :premium, :admin]

  def collaborators
  	Collaborator.where(user_id: id)
  end
end
