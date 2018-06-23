require 'features_helper'

describe 'Add a todo' do
  after do
    TodoRepository.new.clear
  end

  it 'can create a new todo' do
    visit '/todos/new'

    within 'form#todo-form' do
      fill_in 'Name',  with: 'New todo'
      fill_in 'Due date', with: '2018-07-01'

      click_button 'Create'
    end

    current_path.must_equal('/todos')
    assert page.has_content?('New todo')
  end

  it 'displays list of errors when params contains errors' do
    visit '/todos/new'

    within 'form#todo-form' do
      click_button 'Create'
    end

    current_path.must_equal('/todos')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Name must be filled')
    assert page.has_content?('Due Date must be filled')
  end
end
