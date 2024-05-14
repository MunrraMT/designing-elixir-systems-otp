defmodule Mastery.Core.Question do
  defstruct ~w[asked substitutions template]a

  alias Mastery.Core.Template

  def new(%Template{} = template) do
    template.generators
    |> Enum.map(&build_substitution/1)
    |> evaluate(template)
  end

  defp compile(template, substitutions) do
    template.compiled
    |> Code.eval_quoted(assigns: substitutions)
    |> elem(0)
  end

  defp evaluate(substitutions, template) do
    %__MODULE__{
      asked: compile(template, substitutions),
      substitutions: substitutions,
      template: template
    }
  end

  defp build_substitution({name, choices_or_generator}) do
    {name, choose(choices_or_generator)}
  end

  defp choose(choices) when is_list(choices) do
    Enum.random(choices)
  end

  defp choose(generator) when is_function(generator) do
    generator.()
  end
end
