module TodosHelper
	def state(todo)
		if todo.state == 'Open'
			return 'panel-danger'
		elsif todo.state == 'Close'
			return 'panel-primary'
		else
			return 'panel-warning'
		end

	end
end
