require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @normalFormat = tasks(:normalFormat)
    @lessThan3Char = tasks(:lessThan3Char)
    @moreThan30Char = tasks(:moreThan30Char)
    @moreThan100Char= tasks(:moreThan100Char)
  end

  test "should reject task without name" do
    @task = Task.create(details: @normalFormat.details, due_date: @normalFormat.due_date)

    assert_not @task.save, "Saved task without task name"
  end

  test "should reject tasks without details" do
    @task = Task.create(name: @normalFormat.name, due_date: @normalFormat.due_date)

    assert_not @task.save, "Saved task without task details"
  end

  test "should reject tasks without due_date" do
    @task = Task.create(name: @normalFormat.name, details: @normalFormat.details)

    assert_not @task.save, "Saved task without task details"
  end

  test "should reject tasks with name less than 3 char" do
    @task = Task.create(name: @lessThan3Char.name, details: @lessThan3Char.details, due_date: @lessThan3Char.due_date)

    assert_not @task.save, "Saved task with name less than 3 characters"
  end

  test "should reject tasks with name more than 30 char" do
    @task = Task.create(name: @moreThan30Char.name, details: @moreThan30Char.details, due_date: @moreThan30Char.due_date)

    assert_not @task.save, "Saved task with name more than 30 characters"
  end

  test "should reject tasks with details more than 100 char" do
    @task = Task.create(name: @moreThan100Char.name, details: @moreThan100Char.details, due_date: @moreThan100Char.due_date)

    assert_not @task.save, "Saved task with details more than 30 characters"
  end

  test "should reject tasks with details less than 3 char" do
    @task = Task.create(name: @lessThan3Char.name, details: @lessThan3Char.details, due_date: @lessThan3Char.due_date)

    assert_not @task.save, "Saved task with details less than 3 characters"
  end
end
