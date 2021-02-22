class Result
  attr_reader :errors

  def initialize
    @errors = {}
    @data = {}
  end

  def failure?
    !errors.empty?
  end

  def add_error(error_args = {})
    @errors = error_args
  end

  def assign(key, value)
    @data[key] = value
    value
  end

  def data
    @data.dup
  end
end
