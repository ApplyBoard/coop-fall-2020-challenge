class EventSourcer
  def initialize()
    @value = 0
  end

  attr_reader :value

  def add(num)
  end

  def subtract(num)
  end

  def undo()
  end

  def redo()
  end

  def bulk_undo(amount)
  end

  def bulk_redo(amount)
  end
end
