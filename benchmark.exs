{:ok, conn} = Redix.start_link(host: "localhost", port: 6379)
:ets.new(:boom, [:set, :public, :named_table])
in_memory = %{ "boom" => 1}

Benchee.run(%{
  #"ets.insert" => fn -> :ets.insert(:boom, {1, 1}) end,
  #"redis.set" => fn -> Redix.command(conn, ["SET", "1", "1"]) end,
  "ets.lookup" => fn -> :ets.lookup(:boom, 1) end,
  "map.lookup" => fn -> in_memory["boom"] end,
  "redis.get" => fn -> Redix.command(conn, ["GET", "1"]) end
})
