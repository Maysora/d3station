# t.string :email,              :null => false, :default => ""
# t.string :encrypted_password, :null => false, :default => ""
# t.string   :reset_password_token
# t.datetime :reset_password_sent_at
# t.datetime :remember_created_at
# t.integer  :sign_in_count, :default => 0
# t.datetime :current_sign_in_at
# t.datetime :last_sign_in_at
# t.string   :current_sign_in_ip
# t.string   :last_sign_in_ip

# t.boolean    :is_mod, default: false
# t.string     :battlenet_username
# t.string     :battlenet_tag
# t.string     :twitch_username

# t.timestamps

class User < ActiveRecord::Base
  BATTLE_ID_FORMAT = /\A([^#|\s]+)#(\d+)\z/

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :twitch_username, :battlenet_id, :category_list

  validates :battlenet_id, presence: true, format: {with: BATTLE_ID_FORMAT, allow_nil: true}
  validates :battlenet_tag, uniqueness: {allow_nil: true, scope: [:battlenet_username]}

  acts_as_taggable
  acts_as_taggable_on :categories

  def twitch_data
    return nil unless twitch_username.present?
    @twitch_data ||= TwitchData.new(twitch_username)
  end

  def battlenet_id
    if battlenet_username.present? && battlenet_tag.present?
      [battlenet_username, battlenet_tag].join('#')
    else
      nil
    end
  end

  def battlenet_id= value
    if value =~ BATTLE_ID_FORMAT
      self.battlenet_username = $1
      self.battlenet_tag = $2
    end
  end

  def self.category_list
    ActsAsTaggableOn::Tag.joins(:taggings).where("taggings.context = 'categories'").pluck("tags.name")
  end
end
