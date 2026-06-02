class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[title body] #lista de atributos permitidos para pesquisa
  end

  def self.ransackable_associations(auth_object = nil)
    []  
  end

end
