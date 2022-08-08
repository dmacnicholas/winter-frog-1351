class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants
  has_many :garden, through: :plots
end
