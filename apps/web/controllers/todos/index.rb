module Web::Controllers::Todos
  class Index
    include Web::Action

    expose :todos

    def call(params)
      @todos = TodoRepository.new.all
    end
  end
end
