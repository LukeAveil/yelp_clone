require 'rails_helper'

feature 'restaurants have been added' do
  context 'no restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end

    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end

    scenario 'displays restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end
end
