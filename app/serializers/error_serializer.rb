class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def not_found
    {
      errors: [
        {
          status: '404',
          title: @error
        }
      ]
    }
  end

  def bad_request
    {
      errors: [
        {
          status: '400',
          title: @error
        }
      ]
    }
  end
end
