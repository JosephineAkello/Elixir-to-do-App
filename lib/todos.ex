defmodule Todos do

  def hello_world do
    # "Hello world"
    IO.puts("Hellooo world")
  end

  def list do
    ["bananas", "oranges", "apples"]
  end

  def create_todos do
    number_of_tasks = IO.gets("Enter the number of tasks:")
    {number_of_tasks, _q } = Integer.parse(number_of_tasks)
    number_of_tasks
  end
end
