require 'features_helper'

describe 'List todos' do
  let(:repository) { TodoRepository.new }
  before do
    repository.clear

    repository.create(name: 'Cleaning', due_date: '2018-07-01')
    repository.create(name: 'Buy book', due_date: '2019-01-01')
  end

  it 'displays each todo on the page' do
    visit '/todos'

    within '#todos' do
      assert page.has_css?('.todo', count: 2), 'Expected to find 2 todos'
    end
  end
end
