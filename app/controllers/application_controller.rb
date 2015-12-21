class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  protect_from_forgery with: :exception

=======
  protect_from_forgery with: :exceptions
>>>>>>> 3eacbaa7c5c9ecfea571c85c59a319af1cd84887
end
