class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def display_first_name
    return self.preferred_name if self.preferred_name
    self.first_name
  end

  def display_full_name
    "#{self.display_first_name} #{self.last_name}"
  end
end
