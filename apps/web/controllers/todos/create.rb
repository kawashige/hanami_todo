module Web::Controllers::Todos
  class Create
    include Web::Action

    expose :todo

    params do
      required(:todo).schema do
        required(:name).filled(:str?)
        required(:due_date).filled(:str?)
      end
    end

    def call(params)
      if @params.valid?
        TodoRepository.new.create(params[:todo])

        redirect_to routes.todos_path
      else
        self.status = 422
      end
    end
  end
end
