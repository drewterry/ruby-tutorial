class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, 
         :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    # if oauth_user exists, do nothing
    unless user
      puts 'no existing oauth'
      user = User.find_by(email: auth.info.email)
      # if normal user exists, dont create a new one
      unless user
        puts 'new user'
        user = User.new
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
      end
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name if user.first_name.blank?
      user.last_name = auth.info.last_name if user.last_name.blank?
      user.display_name = "#{auth.info.first_name} #{auth.info.last_name}" if user.display_name.blank?

      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
      user.save
    end
    puts user.inspect
    user
  end

  # Allow accounts to be email-less if using OAuth
  def email_required?
    true unless provider?
  end
end
