class Garden < ApplicationRecord
  has_many :plots
  has_many :plot_pants, through: :plots
  has_many :plants, through: :plot_pants
end
