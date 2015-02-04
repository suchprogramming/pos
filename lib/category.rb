class Category < ActiveRecord::Base
  has_many :products
  validates(:name, {:presence => true, :length => {:maximum => 30}})
  before_save(:titlecase_name)

  private

  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
