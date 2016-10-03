class Like < ActiveRecord::Base
  belongs_to  :chef
  belongs_to  :recipe
  
  validates_uniqueness_of :chef, scope: :recipe #alow chef to vote only one time for each recipe
end