defmodule Todos do
  def hello_world do
    # "Hello world"
    IO.puts("Hellooo world")
  end

  def list do
    ["bananas", "oranges", "apples"]
  end

  def create_todos do
    # number_of_tasks = IO.gets("Enter the number of tasks:")
    # {number_of_tasks, _q } = Integer.parse(number_of_tasks)

    {number_of_tasks, _} = IO.gets("Enter the number of tasks:") |> Integer.parse()

    for _ <- 1..number_of_tasks do
      IO.gets("Enter a Task: ") |> String.trim()
      # task = IO.gets("Enter a Task: ")
      # String.trim(task)

    end
  end

  def temp_todos do
    ["eat apple", "read books", "exercise", "take a walk"]
  end

  # check if an element is in an enum
  def contains?(tasks, task) do
    Enum.member?(tasks, task)
  end

  def keyword_search(tasks, word) do
    for task <- tasks, String.contains?(task, word) do
      task
    end
  end

  def random_tasks(tasks) do
    [tasks] = Enum.take_random(tasks, 1)
    tasks
  end

  def add_new_todo(tasks, task) do
    List.insert_at(tasks, -1, task)

  end

  def complete_todo(tasks, task) do
 if contains?(tasks, task) do
  List.delete(tasks, task)
   else
  :not_found_error
  end
end

def save(tasks, filename) do
  binary = :erlang.term_to_binary(tasks)
  File.write(filename, binary)
end

def read(filename) do
  case File.read(filename) do
    {:ok, binary } -> :erlang.binary_to_term(binary)
    {:error, _reason} -> "File does not exist"
  end
  # {_status, binary} = File.read(filename)
  # :erlang.binary_to_term(binary)
end
end
