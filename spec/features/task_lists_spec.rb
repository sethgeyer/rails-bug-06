require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do
  before(:each) do
    user = create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    login(user)
  end
  scenario 'User can view task lists' do
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario 'User can link to edit task list items' do

    click_on "+ Add Task", match: :first
    fill_in "Description", with: "Something important"
    click_on "Create Task"

    click_on "+ Add Task", match: :first
    fill_in "Description", with: "aaaHaircut"
    click_on "Create Task"

    expect(page).to have_content("Something important")
    expect(page).to have_content("aaaHaircut")

    first(".task").click_link("edit")
    # expect(page).to have_button("Update Task")
    # expect(page).to have_content("aaaGarage Chores")

  end



end