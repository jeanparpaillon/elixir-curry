defmodule CurryTest do
  @moduledoc false
  use ExUnit.Case

  test "defc /5" do
    defmodule Test1 do
      @moduledoc false
      use Curry

      defc f(a, b, c, d, e) do
        %{a: a, b: b, c: c, d: d, e: e}
      end
    end

    assert %{a: 1, b: 2, c: 3, d: 4, e: 5} = Test1.f(1, 2, 3, 4, 5)

    assert is_function(Test1.f(1,2,3,4), 1)
    assert is_function(Test1.f(1,2,3), 1)
    assert is_function(Test1.f(1,2), 1)
    assert is_function(Test1.f(1), 1)

    assert %{a: 1, b: 2, c: 3, d: 4, e: 5} = Test1.f(1).(2).(3).(4).(5)

    i = 1
    assert %{a: 1, b: 2, c: 3, d: 4, e: 5} = Test1.f(i).(i+1).(i+2).(i+3).(i+4)
  end
end
