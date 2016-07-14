require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("root path '/'", {:type => :feature}) do
  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('Library App')
  end
end

describe('/books path - display all books') do
end

describe('/books path - display all books', {:type => :feature}) do
  it('displays book catalog') do
    visit('/')
    click_link('Admin')
    expect(page).to have_content('Book Catalog')
  end
end

describe('/admin - adding a book', {:type => :feature}) do
  it("lists all the book's authors") do
    visit('/')
    click_link('Admin')
    fill_in('book', :with => 'The Hobbit')
    click_button('Add')
    expect(page).to have_content('The Hobbit')
  end
end
