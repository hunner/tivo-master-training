Facter.add("home") do
  setcode do
    # ruby code here
    ENV['HOME']
  end
end

Facter.add("home2") do
  setcode 'echo $HOME'
end

ENV.each do |k,v|
  Facter.add("env_" + k) do
    setcode { v }
  end
end
