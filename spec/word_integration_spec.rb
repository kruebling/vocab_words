require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word', {:type => :feature}) do
  it('adds words to dictionary list') do
    visit('/')
    fill_in('vocab', :with => 'ruby')
    fill_in('definition', :with => 'a dynamic, reflective, object-oriented, general-purpose programming language.')
    click_button('Submit!')
    expect(page).to have_content('ruby')
  end

  it('displays word and definition page') do
    visit('/')
    click_link('ruby')
    expect(page).to have_content('Word: ruby')
    expect(page).to have_content('Definition: a dynamic, reflective, object-oriented, general-purpose programming language.')
  end

  it ('will add many definitions to words') do
    visit('/')
    fill_in('vocab', :with => 'ruby')
    fill_in('definition', :with => 'a dynamic, reflective, object-oriented, general-purpose programming language.')
    click_link('ruby')
    click_link('Add Another Definition!')
    visit('/definition/1')
    fill_in('definition', :with => "Ruby sometimes doesnt work the way I think it will...")
    click_button('Submit!')
    expect(page).to have_content('ruby')
  end
end
