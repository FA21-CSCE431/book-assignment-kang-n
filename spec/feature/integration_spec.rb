# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'Out of the Easy'
        fill_in 'Author', with: 'Ruta Sepetys'
        fill_in 'Price', with: 10.99
        fill_in 'Published date', with: '2013-02-12'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('Out of the Easy')
        click_link('Show')
        expect(page).to have_content('Out of the Easy')
        expect(page).to have_content('Ruta Sepetys')
        expect(page).to have_content('10.99')
        expect(page).to have_content('2013-02-12')
    end

    scenario 'blank title' do
        visit new_book_path 
        fill_in 'Author', with: 'Ruta Sepetys'
        fill_in 'Price', with: 10.99
        fill_in 'Published date', with: '2013-02-12'
        click_on 'Create Book'
        expect(page).to have_content('Title can\'t be blank')
    end
    
    scenario 'blank author' do
        visit new_book_path 
        fill_in 'Title', with: 'Out of the Easy'
        fill_in 'Price', with: 10.99
        fill_in 'Published date', with: '2013-02-12'
        click_on 'Create Book'
        expect(page).to have_content('Author can\'t be blank')
    end
    
    scenario 'invalid/blank price' do
        visit new_book_path
        fill_in 'Title', with: 'Out of the Easy'
        fill_in 'Author', with: 'Ruta Sepetys' 
        fill_in 'Published date', with: '2013-02-12'
        click_on 'Create Book'
        expect(page).to have_content('Price can\'t be blank')
        fill_in 'Title', with: 'Out of the Easy'
        fill_in 'Author', with: 'Ruta Sepetys' 
        fill_in 'Price', with: 'test_string'
        fill_in 'Published date', with: '2013-02-12'
        click_on 'Create Book'
        expect(page).to have_content('Price is not a number')
    end

end