class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
    # 「remember_token」という仮想の属性を作成します。
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { in: 5..100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
  validates :employee_number, presence: true, length: { minimum: 4 }
  validates :affiliation, length: { in: 2..30 }, allow_blank: true
  
  def User.digest(string)
    cost = 
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def self.import(file)
    list = []
    CSV.foreach(file.path, headers: true) do |row|
      User.create(list)
        list << { name: row["name"],
                email: row["email"],
                affiliation: row["affiliation"],
                employee_number: row["affiliation"]
        }      
    end
  end
  
    # 更新を許可するカラムを定義
  def self.updatable_attributes
     ["name", "email", "affiliation", "employee_number"]
  end
  
    # 永続セッションのためハッシュ化したトークンをデータベースに記憶します。
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
end
