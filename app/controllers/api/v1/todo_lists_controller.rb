module Api
  module V1
    class TodoListsController < BaseController

      def index
        @todo_lists = current_user.todo_lists
      end

      def create
        @todo_list = current_user.todo_lists.build(todo_list_params)
        @successfully_created = @todo_list.save
      end

      def destroy
        @successfully_deleted = true
        @todo_list = current_user.todo_lists.find(params[:id])
        return if @todo_list.destroy

        @successfully_deleted = false

      rescue ActiveRecord::RecordNotFound => e
        @successfully_deleted = false
        @error = e.message.split(' [')[0]
      end

      private

      def todo_list_params
        params.require(:todo_list).permit(:title)
      end
    end
  end
end
