require 'rails_helper'

feature 'Restaurants:' do 

	context 'When no restaurants have been added' do 
		scenario 'it should display a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants'
			expect(page).to have_link 'Add a restaurant'
		end
	end

end