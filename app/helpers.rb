# Helper methods defined here can be accessed in any controller or view in the application

Infofund.helpers do
  def active_if_is(where)
    @location == where ? 'active' : ''
  end
  # def simple_helper_method
  #  ...
  # end
end
