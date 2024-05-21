defmodule QuizBuilders do
  defmacro __using__(options) do
    quote do
      alias Mastery.Core.{Template, Response, Quiz}
      import QuizBuilders
    end
  end
end

alias Mastery.Core.{Template, Question, Quiz}
