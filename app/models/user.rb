class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  acts_as_voter

  #->Prelang (user_login/devise)
  has_many :post, foreign_key: "author_id"
  has_many :comment, foreign_key: "author_id"
  has_many :post_views
  has_many :sports_users
  has_many :sports, through: :sports_users

  ROLES = %i[admin athlete coach banned]

  validates :birth_date, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  delegate :can?, :cannot?, :to => :ability

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    # The User was found in our database
    return user if user

    # Check if the User is already registered without Facebook
    user = User.where(email: auth.info.email).first

    return user if user

    # The User was not found and we need to create them
    User.create(name:     auth.extra.raw_info.name,
                provider: auth.provider,
                uid:      auth.uid,
                email:    auth.info.email,
                password: Devise.friendly_token[0,20])
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end

  def coach?
    role == 'coach'
  end

  def athlete?
    role == 'athlete'
  end

  def ability
    @ability ||= Ability.new(self)
  end
end
