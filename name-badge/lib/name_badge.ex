defmodule NameBadge do
  def print(id, name, department) do
    id = if id, do: "[#{id}] - ", else: ""
    badge = if department, do: String.upcase(department), else: "OWNER"
    "#{id}#{name} - #{badge}"
  end
end
