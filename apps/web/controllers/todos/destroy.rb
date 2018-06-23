module Web::Controllers::Todos
  class Destroy
    include Web::Action

    def call(params)
      TodoRepository.new.delete(params[:id])
      redirect_to routes.todos_path
    end
  end
end
