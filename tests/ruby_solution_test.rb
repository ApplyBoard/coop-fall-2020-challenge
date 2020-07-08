require_relative "../solution_ruby"
require "test/unit"
require "json"


class TestChallenge < Test::Unit::TestCase
  # Happy path tests
  def test_add
    sourcer = EventSourcer.new
    sourcer.add(2)
    sourcer.add(5)

    assert_equal sourcer.value, 7
  end

  def test_subtract
    sourcer = EventSourcer.new
    sourcer.subtract(2)
    sourcer.subtract(5)

    assert_equal sourcer.value, -7
  end

  def test_undo
    sourcer = EventSourcer.new
    sourcer.add(2)
    sourcer.add(2)
    sourcer.add(2)
    sourcer.add(2)
    sourcer.undo()

    assert_equal sourcer.value, 6
  end

  def test_redo
    sourcer = EventSourcer.new
    sourcer.add(5)
    sourcer.add(5)
    sourcer.add(5)
    sourcer.undo()
    sourcer.undo()
    sourcer.add(1)
    sourcer.redo()

    assert_equal sourcer.value, 11
  end

  def test_bulk_undo
    sourcer = EventSourcer.new
    sourcer.add(1)
    sourcer.add(2)
    sourcer.add(3)
    sourcer.add(4)
    sourcer.add(5)
    sourcer.bulk_undo(3)

    assert_equal sourcer.value, 3
  end

  def test_bulk_redo
    sourcer = EventSourcer.new
    sourcer.add(1)
    sourcer.add(1)
    sourcer.add(1)
    sourcer.add(1)
    sourcer.add(1)
    sourcer.undo()
    sourcer.undo()
    sourcer.undo()
    sourcer.undo()
    sourcer.bulk_redo(4)

    assert_equal sourcer.value, 5
  end

  def test_undo_no_actions
    sourcer = EventSourcer.new
    sourcer.undo()

    assert_equal sourcer.value, 0
  end

  def test_redo_with_no_redo_step
    sourcer = EventSourcer.new
    sourcer.redo()

    assert_equal sourcer.value, 0
  end

  def test_bulk_undo_overstep
    sourcer = EventSourcer.new
    sourcer.add(5)
    sourcer.add(5)
    sourcer.add(5)
    sourcer.subtract(5)
    sourcer.bulk_undo(5)

    assert_equal sourcer.value, 0
  end

  def test_bulk_redo_overstep
    sourcer = EventSourcer.new
    sourcer.add(5)
    sourcer.add(5)
    sourcer.add(5)
    sourcer.add(5)
    sourcer.add(5)
    sourcer.undo()
    sourcer.undo()
    sourcer.undo()
    sourcer.bulk_redo(5)

    assert_equal sourcer.value, 25
  end
end
