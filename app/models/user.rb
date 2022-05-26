class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_save :create_nickname
  
  def create_nickname
    @nickname = 'securerandom'
  end
  
  has_many :posts
  
  mount_uploader :avatar, ImageUploader
  
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # has_many :followers,
  #         class_name: 'Relationship',
  #         foreign_key: 'follower_id',
  #         dependent: :destroy,
  #         inverse_of: :follower
  # has_many :followings,
  #         class_name: 'Relationship',
  #         foreign_key: 'following_id',
  #         dependent: :destroy,
  #         inverse_of: :following
           
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
end
