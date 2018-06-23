require_relative '../../spec_helper'

describe Todo do
  it 'can be initialized with attributes' do
    todo = Todo.new(name: 'Buy book', due_date: '2018-07-01')
    todo.name.must_equal 'Buy book'
  end
end
