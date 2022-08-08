require 'rails_helper'

RSpec.describe "Gardens Show Page" do
  it 'shows a list of unique plants and plants less than 100 days to harvest' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)

    plot_1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: turing_garden.id)
    plot_2 = Plot.create!(number: 26, size: "Small", direction: "West", garden_id: turing_garden.id)
    plot_3 = Plot.create!(number: 2, size: "Small", direction: "South", garden_id: turing_garden.id)

    plant_1 = Plant.create!(name: 'Tomato', description: 'Juicy', days_to_harvest: 23)
    plant_2 = Plant.create!(name: 'Lettuce', description: 'Cripsy', days_to_harvest: 33)
    plant_3 = Plant.create!(name: 'Cucumber', description: 'Delicious', days_to_harvest: 43)
    plant_4 = Plant.create!(name: 'Carrot', description: 'Orange', days_to_harvest: 53)
    plant_5 = Plant.create!(name: 'Peppers', description: 'Spicy', days_to_harvest: 153)
    plant_6 = Plant.create!(name: 'Cucumber', description: 'Delicious', days_to_harvest: 43)
    plant_7 = Plant.create!(name: 'Tomato', description: 'Juicy', days_to_harvest: 23)
    plant_8 = Plant.create!(name: 'Basil', description: 'Green', days_to_harvest: 143)

    plot_plant_1 = PlotPlant.create!(plot_id: plot_1.id, plant_id: plant_1.id )
    plot_plant_2 = PlotPlant.create!(plot_id: plot_2.id, plant_id: plant_2.id )
    plot_plant_3 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_3.id )
    plot_plant_4 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_4.id )
    plot_plant_5 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_5.id )
    plot_plant_6 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_6.id )
    plot_plant_7 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_7.id )
    plot_plant_8 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_8.id )

    visit "/gardens/#{turing_garden.id}"

    expect(page).to have_content('Tomato', count: 1)
    expect(page).to have_content('Lettuce', count: 1)
    expect(page).to have_content('Cucumber', count: 1)
    expect(page).to have_content('Carrot', count: 1)
    expect(page).to_not have_content('Peppers')
    expect(page).to_not have_content('Basil')
  end
end
