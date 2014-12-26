require 'rails_helper'

feature 'Restaurants:' do 

	context 'When no restaurants have been added' do 
		scenario 'it should display a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'When restaurants have been added' do 
		before do 
			Restaurant.create(name: 'KFC')
		end
		scenario 'it should display the restaurants' do 
			visit '/restaurants'
			expect(page).to have_content('KFC')
			expect(page).not_to have_content('No restaurants yet')
		end
	end

	context 'When creating restaurants:' do 
		scenario 'Prompt the user to fill a form, then display the new restaurant' do 
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'KFC'
			click_button 'Create Restaurant'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
		end
	end

	context 'When viewing the restaurant' do 
		let!(:kfc){Restaurant.create(name: 'KFC')}

		scenario "it let's the user view restaurant's page" do 
			visit '/restaurants'
			click_link 'KFC'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq "/restaurants/#{kfc.id}"
		end
	end

	context 'When editing restaurants' do 
		before {Restaurant.create(name: 'KFC')}

		scenario 'it allows the user to modify the details of a restaurant' do 
			visit '/restaurants'
			click_link 'Edit KFC'
			fill_in 'Name', with: 'Kentucky Fried Chicken'
			click_button 'Update Restaurant'
			expect(page).to have_content 'Kentucky Fried Chicken'
			expect(current_path).to eq '/restaurants'
		end
	end

end

























