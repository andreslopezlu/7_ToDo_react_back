module Api
  module V1
    class ItemsController < BaseController

      def index
        @items = todo_list.items
      end

      def create
        @item = todo_list.items.build(item_params)
        @succesfuly_created = @item.save

      rescue ActiveRecord::RecordNotFound => e
        @succesfuly_created = false
        @error = e.message.split(' [')[0]
      end

      private

      def todo_list_params
        params.require(:todo_list).permit(:title)
      end

      def item_params
        params.require(:item).permit(:description)
      end

      def todo_list
        @todo_list ||= current_user.todo_lists.find(params[:todo_list_id])
      end
    end
  end
end
