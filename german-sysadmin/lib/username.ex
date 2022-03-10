defmodule Username do
  def sanitize(''), do: ''

  def sanitize([head | rest]) do
    letter =
      case head do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        ?_ -> '_'
        x when x in ?a..?z -> [x]
        _ -> ''
      end

    letter ++ sanitize(rest)
  end
end
