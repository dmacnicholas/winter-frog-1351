require 'rails_helper'

RSpec.describe "Plots Index Page" do
  it 'displays all plot numbers and the plots plants' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    library_garden = Garden.create!(name: 'Public Library Garden', organic: true)

    plot_1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: turing_garden.id)
    plot_2 = Plot.create!(number: 26, size: "Small", direction: "West", garden_id: turing_garden.id)
    plot_3 = Plot.create!(number: 2, size: "Small", direction: "South", garden_id: library_garden.id)

    plant_1 = Plant.create!(name: 'Tomato', description: 'Juicy', days_to_harvest: 23)
    plant_2 = Plant.create!(name: 'Lettuce', description: 'Cripsy', days_to_harvest: 33)
    plant_3 = Plant.create!(name: 'Cucumber', description: 'Delicious', days_to_harvest: 43)
    plant_4 = Plant.create!(name: 'Carrot', description: 'Orange', days_to_harvest: 53)


    plot_plant_1 = PlotPlant.create!(plot_id: plot_1.id, plant_id: plant_1.id )
    plot_plant_2 = PlotPlant.create!(plot_id: plot_2.id, plant_id: plant_2.id )
    plot_plant_3 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_3.id )

    visit "/plots"

    within "#plot-#{plot_1.id}" do
     expect(page).to have_content(plot_1.number)
     expect(page).to have_content('Tomato')
   end

   within "#plot-#{plot_2.id}" do
     expect(page).to have_content(plot_2.number)
     expect(page).to have_content('Lettuce')
   end

   within "#plot-#{plot_3.id}" do
     expect(page).to have_content(plot_3.number)
     expect(page).to have_content('Cucumber')
   end

   expect(page).to_not have_content('Carrot')
 end

 it 'displays a link to delete a plant from the plot' do
   turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
   library_garden = Garden.create!(name: 'Public Library Garden', organic: true)

   plot_1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: turing_garden.id)
   plot_2 = Plot.create!(number: 26, size: "Small", direction: "West", garden_id: turing_garden.id)
   plot_3 = Plot.create!(number: 2, size: "Small", direction: "South", garden_id: library_garden.id)

   plant_1 = Plant.create!(name: 'Tomato', description: 'Juicy', days_to_harvest: 23)
   plant_2 = Plant.create!(name: 'Lettuce', description: 'Cripsy', days_to_harvest: 33)
   plant_3 = Plant.create!(name: 'Cucumber', description: 'Delicious', days_to_harvest: 43)
   plant_4 = Plant.create!(name: 'Carrot', description: 'Orange', days_to_harvest: 53)


   plot_plant_1 = PlotPlant.create!(plot_id: plot_1.id, plant_id: plant_1.id )
   plot_plant_2 = PlotPlant.create!(plot_id: plot_2.id, plant_id: plant_2.id )
   plot_plant_3 = PlotPlant.create!(plot_id: plot_3.id, plant_id: plant_3.id )

   visit "/plots"

   within "#plot-#{plot_1.id}" do
     expect(page).to have_link('Remove Plant')
     click_on 'Remove Plant'
   end

   expect(current_path).to eq("/plots")

   within "#plot-#{plot_1.id}" do
     expect(page).to_not have_content('Tomato')
   end
end
