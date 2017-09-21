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
    expect(page).to have_content('Definition 1: a dynamic, reflective, object-oriented, general-purpose programming language.')
  end

  it ('will add many definitions to words') do
    visit('/')
    click_link('ruby')
    fill_in('definition', :with => "Ruby sometimes doesnt work the way I think it will...")
    click_button('Add!')
    visit('/')
    click_link('ruby')
    expect(page).to have_content('Word: ruby')
    expect(page).to have_content('Definition 1: a dynamic, reflective, object-oriented, general-purpose programming language.')
    expect(page).to have_content('Definition 2: Ruby sometimes doesnt work the way I think it will...')

  end
end
