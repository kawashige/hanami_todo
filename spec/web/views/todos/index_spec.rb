require_relative '../../../spec_helper'

describe Web::Views::Todos::Index do
  let(:exposures) { Hash[todos: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/todos/index.html.erb') }
  let(:view)      { Web::Views::Todos::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #todos' do
    view.todos.must_equal exposures.fetch(:todos)
  end

  describe 'when there are no todos' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no todos yet.</p>')
    end
  end

  describe 'when there are todos' do
    let(:params) { Hash[] }
    let(:todo1)     { Todo.new(name: 'Cleaning', due_date: '2018-07-01') }
    let(:todo2)     { Todo.new(name: 'Buy book', due_date: '2019-01-01') }
    let(:exposures) { Hash[todos: [todo1, todo2], params: params] }

    it 'lists them all' do
      rendered.scan(/class="todo"/).count.must_equal 2
      rendered.must_include('Cleaning')
      rendered.must_include('Buy book')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no todos yet.</p>')
    end
  end
end
