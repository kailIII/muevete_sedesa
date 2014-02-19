class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :followed_actions, through: :relationships, source: :action

  def doing_action?(accion)
    relationships.find_by(action_id: accion.id)
  end

  def do_action!(accion)
    relationships.create!(action_id: accion.id)
  end

end
