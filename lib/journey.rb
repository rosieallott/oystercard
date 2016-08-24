class Journey

  def initialize
    @complete = false
  end

  def complete?
    @complete
  end

  def finish
    @complete = true
  end

end
