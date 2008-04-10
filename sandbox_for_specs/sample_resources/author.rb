class Author #:nodoc:
  include Stone::Resource
  
  field :name, String
  field :email, String
  field :favorite_number, Fixnum
  field :created_at, DateTime

  validates_presence_of :name, :email
  
  before_save :cap_name
  before_save :give_random_number
  
  has_many :posts
  has_many :comments
  
  def cap_name
    self.name = self.name.titlecase
  end
  
  def give_random_number
    self.favorite_number = rand(50)+1 unless self.favorite_number
  end
end