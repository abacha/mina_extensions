module Mina
  module SshHelpers
    def ssh_command
      args = domain!.dup
      host = "#{user}@#{args}" if user?
      args << " -i #{identity_file}" if identity_file?
      args << " -p #{port}" if port?
      args << " -A" if forward_agent?
      args << " #{ssh_options}"  if ssh_options?
      args << " -t"
      if system("which mosh > /dev/null")
        "mosh --ssh \"ssh #{args}\" #{host}"
      else
        "ssh #{host} #{args}"
      end
    end
  end
end
