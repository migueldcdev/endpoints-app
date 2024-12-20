defmodule Utils do
    def random_even_number() do
        :rand.uniform(100) * 2
    end

    def random_odd_number do
        :rand.uniform(100) * 2 - 1
    end        
end