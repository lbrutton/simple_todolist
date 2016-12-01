class TodoItem < ActiveRecord::Base
	belongs_to :todo_list
	belongs_to :User
	default_scope { order :due_date }
end
