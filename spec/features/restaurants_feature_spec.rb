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

	context'When creating restaurants:' do 
		scenario 'Prompt the user to fill a form, then display the new restaurant' do 
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'KFC'
			click_button 'Create Restaurant'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
		end
	end


end